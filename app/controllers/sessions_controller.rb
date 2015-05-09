class SessionsController < ApplicationController
  layout 'index.html'
  before_filter :authorize, only: [:destroy]
  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id

      flash[:alert]="success"
      redirect_to '/',:notice => 'You have been successfully logged in.'
    else
      # If user's login doesn't work, send them back to the login form.

      flash[:alert]="danger"
      redirect_to '/login',:notice => 'Invalid combination of email and password.'
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:alert]="info"
    redirect_to '/',:notice => 'You have been logged off.'
  end
end

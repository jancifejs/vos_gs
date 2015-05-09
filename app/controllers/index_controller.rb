class IndexController < ApplicationController

  # before_action :set_server, only: [:search]
  # def index
  #   @server=Server.new
  # end
  #
  # def search
  #   print "ahoj"
  # end
  #
  #
  # private
  # def set_server
  #   @server = Server.find_by_name(params[:name])
  #   redirect_to("/servers/#{@server}")
  # end
  #
  # def server_params
  #   params.require(:server).permit(:name)
  #   end
  def index

  end
  def search

    @gameserver = Gameserver.find_by_name(params[:query])
    render js: @gameserver
    #render json: @gameserver
#    redirect_to @gameserver
  #  Gameserver.reindex
  #  @gameservers = Gameserver.search params[:name]
  #  @gameservers.each do |server|
  #    puts server.name
  #  end

#       render js: 'index.js'
    # render :json => @gameservers
  end


  def autocomplete
    render json: Gameserver.search(params[:term], fields: [{name: :text_start}], limit: 10).map(&:name)

  end
end

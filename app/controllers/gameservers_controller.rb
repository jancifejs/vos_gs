class GameserversController < ApplicationController
  before_filter :authorize
  before_action :set_server, only: [:show, :edit, :update, :destroy]

  # GET /servers
  # GET /servers.json
  def index
    @gameservers = Gameserver.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
  end

  # GET /servers/new
  def new
    @gameserver = Gameserver.new
  end

  # GET /servers/1/edit
  def edit
  end

  # POST /servers
  # POST /servers.json
  def create
    @gameserver = Gameserver.new(server_params)

    respond_to do |format|
      if @gameserver.save
        format.html { redirect_to @gameserver, notice: 'Server was successfully created.' }
        format.json { render :show, status: :created, location: @gameserver }
      else
        format.html { render :new }
        format.json { render json: @gameserver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servers/1
  # PATCH/PUT /servers/1.json
  def update
    respond_to do |format|
      if @gameserver.update(server_params)
        format.html { redirect_to @gameserver, notice: 'Server was successfully updated.' }
        format.json { render :show, status: :ok, location: @gameserver }
      else
        format.html { render :edit }
        format.json { render json: @gameserver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.json
  def destroy
    @gameserver.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server
      @gameserver = Gameserver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:gameserver).permit(:name,:ip,:port)
    end
end

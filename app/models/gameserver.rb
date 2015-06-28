class Gameserver < ActiveRecord::Base
  belongs_to :game
  after_initialize :update_info
  attr_accessor :info,:players_no,:players_max,:map,:players

  searchkick text_start: [:name]

  def init(ip,port)
    self.ip=ip
    self.port=port
  end

  def update_info
    server = SourceServer.new(self.ip, self.port)
    begin
      server.init
      info=server.server_info

      self.players_no = info[:number_of_players]
      self.players_max = info[:max_players]
      self.map=info[:map_name]
      self.players = server.players
   # self.player=server.players
      if self.name!=info[:server_name]
        self.name=info[:server_name]
        self.save
      end
    rescue Exception
      self.name="NOT CONNECTED YET"
    end
    #self.name=self.info.`` [:server_name]
    #print self.info

  end


end

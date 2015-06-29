class Gameserver < ActiveRecord::Base
  belongs_to :game
  after_initialize :update_info
  attr_accessor :players_no,:players_max,:map,:server

  searchkick text_start: [:name]

  def init(ip,port)
    self.ip=ip
    self.port=port
  end

  def parse_score(str)
    str.split(',')
  end
  def update_info
    self.server = SourceServer.new(self.ip, self.port)
    begin
      self.server.init
      info=self.server.server_info

      self.players_no = info[:number_of_players]
      self.players_max = info[:max_players]
      self.map=info[:map_name]
      puts self.server.players
   # self.player=server.players
      if self.name!=info[:server_name]
        self.name=info[:server_name]
        self.save

      end
    rescue Exception => ex

      logger.error("Message for the log file #{ex.message}")

    end
    #self.name=self.info.`` [:server_name]
    #print self.info

  end


end

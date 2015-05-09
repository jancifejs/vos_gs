class Gameserver < ActiveRecord::Base
  belongs_to :game
  after_initialize :add_server_info
  attr_accessor :info

  searchkick text_start: [:name]

  def add_server_info
#    @info = GoldSrcServer.new('89.44.246.181', '27015')
 #   @info.init

    # print @info.players
    # puts @info.players

  end

end

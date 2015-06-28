class StatisticsController < ApplicationController
  def index
    #@results=ActiveRecord::Base.connection.execute("select g.id,title,count(g.id) as cnt from games g join gameservers s on game_id=g.id group by g.id,title order by cnt desc limit 10")
    @results=Game.select("games.id,title,count(games.id) cnt").joins(:gameservers).group("games.id,title").order("cnt desc").limit(10)



    @counts = {}
    @results.each  do |result|
      @counts[result['title']]=result['cnt']
    end

  end
end

class Cron_updater
  def pingServers()
    puts "PINGING SERVERS!"
    Gameserver.all.each do |server|
      server.update_info
    end
    puts "REINDEXING!"
    Gameserver.reindex
    puts "DONE!"
  end

end
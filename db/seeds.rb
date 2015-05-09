# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Developers
valve = Developer.create(name:'Valve')
activision = Developer.create(name:'Activision')
eaGames = Developer.create(name:'EA Games')


# Games
cs = Game.create(title:'Counter Strike 1.6',developer_id:valve.id)
csGo = Game.create(title:'Counter Strike: Global Operations',developer_id:valve.id)
bf3 = Game.create(title:'Battlefield 3',developer_id:eaGames.id)


#Servers
Gameserver.create(name: 'RESPAWN.LALEAGANE.RO [CSDM DEATHMATCH]',ip: '89.44.246.34', port: 27015, game_id: cs.id)
Gameserver.create(name: '© ORIGINAL CSDM',ip: '78.107.35.5', port: 27015, game_id: cs.id)
Gameserver.create(name: 'Патриоты СССР ©',ip: '77.220.180.75', port: 27015, game_id: cs.id)
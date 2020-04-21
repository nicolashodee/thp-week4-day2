require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Pierre")
player2 = Player.new("Paul")

player1.show_state
player2.show_state

puts " ********* C'est l'heure du-du-du-du DUEL ! ***** YU-GI-HO !!!!!!!!"

while (player1.life_points > 0 && player2.life_points > 0)
  player1.attacks(player2)
  if (player2.life_points > 0)
    player2.attacks(player1)
  else 
    break
  end
end 
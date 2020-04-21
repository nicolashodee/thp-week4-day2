require 'bundler'
Bundler.require

require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Donne nous ton nom mon jeune enfant :"
name_to_save = gets.chomp.to_s 
human_player = HumanPlayer.new("#{name_to_save}")

puts "Ton prenom est donc #{human_player.name}, tu as #{human_player.life_points} points de vie, et une arme de niveau #{human_player.weapon_level}"
player1 = Player.new("Pierre")
player2 = Player.new("Paul")
puts "------------------------------------------------"
while (human_player.life_points > 0 && ( player1.life_points > 0 && player2.life_points > 0 ))
  puts "\e[41m------------ETAT---DES---LIEUX------------------\e[49m"
  human_player.show_state
  player1.show_state
  player2.show_state
  print "Pret pour faire un choix ? (appuie sur entree)"
  gets.chomp
  puts "\e[44m------------FAIS---TON---CHOIX--------------------\e[49m"
  puts "a - chercher une meilleure arme
  s - chercher à se soigner 
  "
  puts " attaquer un joueur en vue :
  0 - #{player1.name} 
  1 - #{player2.name}
  ------------------------------------------------"
  print "Ton choix est > "
  choice = gets.chomp
  unless (choice == "a" || choice == "s" || choice == "0" || choice == "1")
    puts "Erreur, retape ton choix :"
    choice = gets.chomp 
  end

  if choice == "a"
    human_player.search_weapon 
  elsif choice == "s"
    human_player.search_healthpack 
  elsif choice == "0"
    human_player.attacks(player1)
  elsif choice == "1"
    human_player.attacks(player2)
  else
  end     
  
  
  puts " \e[100mMaintenant les autres joueurs t'attaquent. Pret(e) ? \e[49m"
  gets.chomp 
  ennemies = [player1, player2]
  ennemies.each { |ennemy| 
      if human_player.life_points > 0 && ennemy.life_points > 0
        ennemy.attacks(human_player)
        puts "***************"
      else 
        puts "#{ennemy.name} abandonne l'attaque."
        puts "***************" 
      end
      puts "Pret pour la suite ? (appuie sur entree si oui)"
      gets.chomp 
    }
end
puts "------------GAME---OVER--------------------"
human_player.show_state
ennemies.each { |ennemy| 
  ennemy.show_state }
puts "-------------------------------------------"


require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Donne nous ton nom mon jeune enfant :"
name_to_save = gets.chomp.to_s 
my_game = Game.new("#{name_to_save}") 

Game.show_players


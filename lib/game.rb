class Game
  attr_accessor :name, :life_points, :human_player, :ennemies

  def initialize(name_to_save) 
    player0 = Player.new("Pierre")
    player1 = Player.new("Paul")
    player2 = Player.new("Jacques")
    player3 = Player.new("FrereJacques")
    @ennemies = [player0, player1, player2, player3]
    last_ennemy = @ennemies.last
    human_player = HumanPlayer.new("#{name_to_save}")
    super (name_to_save)
  end
    
 

  def show_players
    puts "\e[41m------------ETAT---DES---LIEUX------------------\e[49m"
    human_player.show_state
    ennemies.each { |ennemy| 
    ennemy.show_state }
  end


   

  def kill_player
    puts "Veuillez entrer un nom d'ennemi a supprimer"
    kill_him = gets.chomp
    @ennemies.delete_if { |ennemy| 
    ennemy == "#{kill_him.downcase.to_s}" 
    }
    print "Liste des players restants"
    puts @ennemies
  end

  def is_still_ongoing?
    if human_player.life_points > 0
      return true
    elsif @ennemies == []
      return true
    else
      return false
    end 
  end 

  def menu 
    puts "\e[44m------------FAIS---TON---CHOIX--------------------\e[49m"
    puts "
    a - chercher une meilleure arme
    s - chercher à se soigner 
    "
    puts "attaquer un joueur en vue :"
    @ennemies.each { |ennemy| 
    puts "Taper #{ennemy.index} pour attaquer :" 
    puts ennemy.name
    }
  end
  
  def menu_choice
    print "Ton choix est > "
    choice = gets.chomp
    if choice == "a"
      human_player.search_weapon 
    elsif choice == "s"
      human_player.search_healthpack
    elsif choice.to_i.is_a? Integer == true       #si choice est un integer, on attaque l'ennemy dont l'index est egal a choice
      @ennemies.each { |ennemy| 
      if choice.to_i == ennemy.index              #on parcourt l'array, et on attaque des que le numero est egal a l'index de la valeur lue
        human_player.attacks(ennemy)
      end 
      }
    else 
    end 
  end  
  





      







end
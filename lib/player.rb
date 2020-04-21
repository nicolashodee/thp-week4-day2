class Player 
  attr_accessor :name, :life_points 
  
  def initialize(name_to_save)
    @name = name_to_save.to_s 
    @life_points = 10.to_i 
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie restants"
  end

  def gets_damage(damage_received)
    @life_points -= damage_received
    if life_points > 0
      return
    else 
      puts "Le joueur #{@name} a été tué !"
    end 
  end 

  def compute_damage
    return rand(1..6)
  end

  def attacks(player_b)
    attack_value = compute_damage
    puts "bouyaka !!!"
    puts "#{self.name} attaque #{player_b.name}"
    puts "Il/elle lui inflige #{attack_value} points de dommages"
    player_b.gets_damage(attack_value)
    puts player_b.show_state
  end 
    
end 

class HumanPlayer < Player
  attr_accessor :weapon_level 
  
  def initialize(name_to_save) 
    @weapon_level = 1
    super (name_to_save)
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end 

  def search_weapon
    dice = rand(1..6)
    if dice == 1
      puts "C'est balo, t'as rien trouvé."
    else
      if dice > @weapon_level
        puts "Tu as trouvé une arme de niveau #{dice}, qui est meilleure arme que la tienne. Tu la prends !"
        @weapon_level = dice 
      else
        puts "M@*#$, tu as seulement trouvé une arme de niveau #{dice}, qui est moins bien ou equivalente a la tienne. Tu la laisse. "
      end 
    end 
  end

  def search_healthpack 
    dice = rand(1..6)
    if dice == 1
      puts "C'est balo, t'as rien trouvé."
    else
      if dice >= 2 && dice <=5
        puts "Tu as trouvé un trousse de 50 points de vie, Tu la prends !"
        puts "Tu avais #{life_points} points de vie."
        @life_points += 50 
        @life_points.clamp(0, 100)
        puts "Tu en as maintenant #{life_points}."   
      else
        puts "Tu as trouvé un trousse de 80 points de vie, Tu la prends !"
        puts "Tu avais #{life_points} points de vie."
        @life_points += 80 
        @life_points.clamp(0, 100)
        puts "Tu en as maintenant #{life_points}."  
      end
    end 
  end 



end 



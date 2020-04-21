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
    puts "#{self.name} attaque #{player_b.name}"
    puts "Il/elle lui inflige #{attack_value} points de dommages"
    player_b.gets_damage(attack_value)
    puts player_b.show_state
  end 
  
  
end 
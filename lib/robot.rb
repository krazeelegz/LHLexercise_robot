class Robot

  include CustomError
  attr_accessor :position, :items, :health, :equipped_weapon

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
    @equipped_weapon = equipped_weapon
  end

  # Fighting
  
  def wound(damage_amount)
    @health -= damage_amount 
    @health = 0 if @health < 0
  end

  def heal (heal_amount)
    @health += heal_amount
    @health = 100 if @health > 100
  end

  def attack(enemy)
    @equipped_weapon.hit(enemy) if @equipped_weapon
  else enemy.wound(5)
  end

# Exceptions

  def heal!(heal_amount)
    if @health <= 0
      raise DeadRobotError, "your robot is dead and can not be revived"
    else
      heal(heal_amount)
    end
  end

  def attack!(enemy, damage)
    if enemy.is_a?(Robot) 
      enemy.health -= damage
    else
      raise FightRobotOnly, "you can only fight robots"
    end
  end

  # Items
  
  def pick_up(item)
    return false if item.weight + items_weight > 250
    @items << item
    @equipped_weapon = item if item.is_a?(Weapon)
    true 
  end

  def items_weight
    @items.inject(0) {|sum, i| sum += i.weight }
  end

  # Movement
  
  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down 
    @position[1] -= 1
  end

end

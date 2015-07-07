# Put your code here to make the tests pass
class Weapon

  attr_reader :name, :damage

  def initialize(name, value)
    @name = name
    @damage = value
  end

end

class BattleBot

  attr_reader :name, :health, :enemies
  attr_accessor :weapon

  @@count = 0

  def initialize(name, health=100, weapon=nil)
    @name = name
    @health = health
    @weapon = weapon
    dead?
    #@@count ||= 0
    @@count += 1
    @enemies = []
  end

  def dead?
    @health > 0 ? false : true
  end

  def pick_up(weapon)
    @weapon = weapon if @weapon.nil?
  end

  def drop_weapon
    @weapon = nil
  end

  def self.count
    @@count
  end

  def attack(opponent)
    raise Exception if self.weapon.nil?
    raise ArgumentError unless opponent.class == BattleBot
    opponent.take_damage(self.weapon.damage)
    opponent.enemies=(self)
  end

  def take_damage(damage)
    @health -= damage
    self.dead?
  end

  protected

  def enemies=(attacker = nil)
    @enemies << attacker unless @enemies.include?(attacker)
    @enemies -= [nil]
  end



end
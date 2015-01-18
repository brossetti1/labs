require 'pry'
require './haslines'
require 'launchy' #load default browser for cat gifs lol..

#AlleyKittens

#fat rats
#roughty racoons
#vacuum cleaner


#d6, d8, d10, d12



class BadGuy

  include Enumerable
  include HasLines

  attr_reader :name
  attr_accessor :attack_damage #:defense

  def initialize(name, level)
    @ability_counter = {}
    init_roll = roll_dice(4)
    @name = name
    @attack_damage = init_roll * level
    @add_attribute = init_roll + level
    @turn_points = @health_per_level + (init_roll * level)
  end


  def each(&block)
    @combo.each do |move|
      yield move
    end
  end


  def alive?
    if @health > 0
      conntinue  #########
    else
      puts "#{@name} the #{self.class} has been slain in pursuit of cheese"
    end
  end


  def basic_attack(other)
    @attack_damage * roll_dice(4)
  end



end




class FatRat < BadGuy
  attr_accessor :bite

  def initalize(name, level)
    @bite = roll_dice(6) #something
    @health_per_level = 10
    super(name, level)
  end


  def tail_slap(kitten)

  end


  def poison(kitten)

  end

end


class Racoon < BadGuy

  attr_accessor :gnaw

  def initialize(name, level)
    @standard_attack = roll_dice(4)
    @health_per_level = 15
    super(name, level)

    def scratch

    end

    def gnaw

    end


  end
end


class LadyWithVacuum < BadGuy

  attr_accessor :frighten

  def initialize(name, level)
    @frighten = roll_dice(5)
    @health_per_level = 20
    super(name, level)
  end


  def turn_vacuum_on_and_charge

  end

  def throw_dust_bin

  end

  def scream

  end

  def adopt(kitten)

  end

end



class Kitten
  attr_accessor :health, :lives, :add_attribute

  include HasLines
  include Enumerable

  def initialize(name)
    @health = roll_dice(10) + 10
    @lives = 9
    @add_attribute = roll_dice(6)
    @turn_points = roll_dice(8) + @add_attribute ####ehh..
    @combo = []
  end

  def self.each(&block)
    @combo.each do |move|
      yield move
    end
  end

  def kitten_dodge(enemey)
    if enemey.class == Racoon || FatRat
      roll_dice(8)
    else
      roll_dice(6)
    end
  end

  def hiss(enemey)
    if enemey.class == Racoon || FatRat
      roll_dice(8)
    else
      roll_dice(6)
    end

  end

  def climb(enemey)
    if enemey.class == FatRat || LadyWithVacuum
      roll_dice(8)
    else
      roll_dice(6)
    end

  end

  def kitten_eyes(enemey)
    if enemey.class == LadyWithVacuum
      kitten_roll = roll_dice(8)
      #enemey
      #compare_rolls(kitten_roll)
    else
      roll_dice(6)
    end
  end








  def is_poisioned?(enemey)
    #if enemey == 
  end

end


b = LadyWithVacuum.new('brenda',2)
a = Kitten.new('charles')
p a.dialogue('dodge_intro', b)

#you win, heres some cat gifs

binding.pry
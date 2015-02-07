=begin
Recognizing dependencies
=end


=begin
The Gear class is dependent on Wheel in these way:
  name - Wheel
  method - diameter
  initialization - parameters (rim, tire)
  initialization - order of parameters
These depencencies 'couple' Gear to Wheel.
Some dependency is necessary (the classes must communicate).
Our goal is to make these dependencies more reasonable.
=end
class Gear
  attr_reader :chainring, :cog, :wheel

  #Notice that the initialization parameters were also changed
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    #This refers directly to a wheel, so it can't refer to any
    #other object that also has a diameter and gear ratio.
    #Gear shouldn't communicate to a Wheel; it should communicate
    #with any object that has a diameter and uses gears.
    # Wheel.new(rim, tire).diameter * ratio

    #Gear now refers to an object that can respond to diameter
    wheel.diameter * ratio
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + tire * 2
  end

  def circumference
    diameter * Math::PI
  end
end

puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

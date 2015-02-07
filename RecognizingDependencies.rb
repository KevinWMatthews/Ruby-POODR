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
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    Wheel.new(rim, tire).diameter * ratio
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

puts Gear.new(52, 11, 26, 1.5).gear_inches

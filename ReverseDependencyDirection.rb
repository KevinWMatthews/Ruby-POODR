=begin
  Gear class no longer depends on Wheel;
  Wheel depends on Gear
=end

class Gear
  #We no longer pass Wheel to Gear
  # attr_reader :chainring, :cog, :wheel
  attr_reader :chainring, :cog
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
  end

  #gear_inches now expects a parameter
  def gear_inches(diameter)
    diameter * ratio
  end

  #gear no longer refers to wheel;
  #wheel refers to gear.
  # def diameter
  #   wheel.diameter
  # end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  #Notice that we now need to pass Gear to Wheel
  attr_reader :rim, :tire, :gear
  def initialize(args)
    @rim  = args[:rim]
    @tire = args[:tire]
    @gear = args[:gear]
  end

  #Wheel now calls Gear's method
  def gear_inches
    gear.gear_inches(diameter)
  end

  def diameter
    rim + tire * 2
  end

  def circumference
    diameter * Math::PI
  end
end

puts Wheel.new(
  :rim => 26,
  :tire => 1.5,
  :gear => Gear.new(
                :chainring => 52,
                :cog       => 11
                )
  ).gear_inches

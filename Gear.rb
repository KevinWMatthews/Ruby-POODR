=begin
#  An example of bicycle gearings:
chainring = 52
cog       = 11
ratio     = chainring / cog.to_f
puts ratio  #4.72

chainring = 30
cog       = 27
ratio     = chainring / cog.to_f
puts ratio  #1.11
=end

class Gear
  attr_reader :chainring, :cog, :wheel

  #Default values for arguments using fetch method
  #Can also specify with ||, but you must be careful
  def initialize(args)
    # @chainring = args.fetch(:chainring, 40)
    # @cog       = args.fetch(:cog, 18)
    # @wheel     = args[:wheel] #This argument must be specifiec

    #Can also use the merge method
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    diameter * ratio
  end

  def diameter
    wheel.diameter
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

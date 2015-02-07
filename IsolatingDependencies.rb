=begin
  If you can't change the class to remove dependencies,
  isolate them as much as possible.
=end

class Gear
=begin
  #Example with dependencies
  attr_reader :chainring, :cog, :rim, :tire

  #Notice that the initialization parameters were also changed
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
    ratio * Wheel.new(rim, tire).diameter
  end
=end

=begin
  #Isolate dependencies
  attr_reader :chainring, :cog, :wheel

  #Notice that the initialization parameters were also changed
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    #This creates a new Wheel with every Gear
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
=end

  #Isolate dependencies
  attr_reader :chainring, :cog, :rim, :tire

  #Notice that the initialization parameters were also changed
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
    ratio * wheel.diameter
  end

  def wheel
    #Not quite sure how this works...
    @wheel ||= Wheel.new(rim, tire)
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

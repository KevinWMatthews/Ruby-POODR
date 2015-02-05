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

  def gear_inches # wheel diameter * gear ratio
    (rim + 2*tire) * ratio
  end
end

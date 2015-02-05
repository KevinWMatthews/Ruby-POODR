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
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

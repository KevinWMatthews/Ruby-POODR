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
  #Using accessor methods encapsulates data into behavior
  #Your program can now reference behavior, which is defined in
  #only one spot, the accessor method, e.g.
  #def cog
    #@cog
  #end
  #If the definition of a cog ever changes, you need only change
  #this one definition rather than every reference to the variable.
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    #Notice that this uses accessor methods
    #instead of referring directly to instance variables
    chainring / cog.to_f
    #Not @chainring / @cog.to_f
  end

  def gear_inches # wheel diameter * gear ratio
    (rim + 2*tire) * ratio
  end
end

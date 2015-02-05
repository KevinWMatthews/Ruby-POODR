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

class WheelData
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect {|wheel|
      #We now have meaningful, abstract references to data
      #using accessor methods. diameters doesn't know anything
      #about how wheel data is stored
      wheel.rim + (wheel.tire * 2 )}
  end

  #A Struct is used because the attributes are fixed.
  #rim and tire are accessor methods
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    #The structure of the array is now buried here.
    #It is hidden using the wheelify method.
    data.collect { |cell|
      Wheel.new(cell[0], cell[1]) }
  end
end

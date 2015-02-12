# A demonstration of duck typing, starting with a bad example

class Trip
  attr_reader :bicycles, :customers, :vehicle

  # this 'mechanic' argument could be of any class
  # If you happen to pass an instance of Mechanic (see below), it works.
  def prepare(mechanic)
    # prepare() has no explicit dependency on Mechanics but its argument must
    # respond to prepare_bicycles
    mechanic.prepare_bycicles(bicycles)
  end

  #...
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each {|bicycle| prepare_bicycle(bicycle)}
  end

  def prepare_bicycle(bicycle)
    #...
  end
end

#Draw a sequence diagram to see what's wrong or see figure 5.1

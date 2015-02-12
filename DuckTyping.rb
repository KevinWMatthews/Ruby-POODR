# A demonstration of duck typing, starting with a bad example
#
#Things get more complicated: add a TripCoordinator and Driver class

class Trip
  attr_reader :bicycles, :customers, :vehicle

  # The preparer argument could be of any class
  # If you happen to pass an instance of Mechanic (see below), it works.
  def prepare(preparers)
    #The argument was set up to handle a Mechanic
    #Now it must be expanded to include every kind of preparer.
    preparers.each {|preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
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

class TripCoordinator
  def buy_food(customers)
    #...
  end
end

class Driver
  def gas_up(vehicle)
    #...
  end

  def fill_water_tank(vehicle)
    #...
  end
end

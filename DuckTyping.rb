# A demonstration of duck typing, starting with a bad example
#
#The solution is to implement a Preparer class that responds to prepare_trip.
#Any object that responds to prepare_trip is a Preparer. That's it!
#This is called a duck type.

#Notice that the Preparer class isn't explicity defined anywhere; it's abstract.
#Be sure to use good tests! They're your documentation.

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
        preparer.prepare_trip(self)
      end
    }
  end

  #...
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle| prepare_bicycle(bicycle)}
  end

  def prepare_bicycle(bicycle)
    #...
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
    #...
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
    #...
  end
end

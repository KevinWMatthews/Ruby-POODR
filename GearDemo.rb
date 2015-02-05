=begin
  Demonstrate various aspects and properties of the Gear class
=end

require_relative 'Gear'

puts Gear.new(52, 11).ratio #This gets broken!
puts Gear.new(30, 27).ratio

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

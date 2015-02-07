=begin
  Demonstrate various aspects and properties of the Gear class
=end

require_relative 'Gear'

# puts Gear.new(52, 11).ratio #This gets broken!
# puts Gear.new(30, 27).ratio

# puts Gear.new(52, 11, 26, 1.5).gear_inches
# puts Gear.new(52, 11, 24, 1.25).gear_inches

puts "Wheel diameters:"
puts WheelData.new([[622, 20], [622, 23], [559, 30], [559, 40]]).diameters
puts

#why the @ ?
@wheel = Wheel.new(26, 1.5)
puts "Wheel circumference:"
puts @wheel.circumference
puts "Wheel diameter:"
puts @wheel.diameter

puts "Gear inches:"
puts Gear.new(52, 11, @wheel).gear_inches

puts "Ratio (which doesn't need a wheel):"
puts Gear.new(52, 11).ratio

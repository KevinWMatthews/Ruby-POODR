=begin
  Demonstrate various aspects and properties of the Gear class
=end

require_relative 'Gear'

puts Gear.new(
              :chainring => 52,
              :cog       => 11,
              :wheel => Wheel.new(26, 1.5)
              ).gear_inches
puts Gear.new( :wheel => Wheel.new(26, 1.5) ).gear_inches

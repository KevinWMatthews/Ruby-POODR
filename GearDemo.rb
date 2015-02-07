=begin
  Demonstrate various aspects and properties of the Gear class
=end

require_relative 'Gear'

#Hey look, the hash keys provide documentation
puts Gear.new(
  :chainring => 52,
  :cog => 11,
  :wheel => Wheel.new(26, 1.5) ).gear_inches

#Nifty. The symbols break the dependency on order
puts Gear.new(
  :wheel => Wheel.new(26, 1.5),
  :chainring => 52,
  :cog => 11 ).gear_inches

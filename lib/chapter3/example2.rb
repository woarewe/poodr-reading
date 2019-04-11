# frozen_string_literal: true

# Compare with dependencies_example.rb
class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end

# Now class Gear expect object with method diameter
# This object can be instance of any class
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

# frozen_string_literal: true

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

# External methods calling isolation

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  # We moved diameter calculation in Gear instance method diameter
  # DRY!
  def gear_inches
    ratio * diameter
  end

  def diameter
    wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

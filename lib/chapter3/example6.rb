# frozen_string_literal: true

# Imagine, that classes Wheel and Gear are not our app classes, they are from other gem
# But we wanna eliminate dependencies from arguments order
# How do it? Just create wrapper for creating Gear instance

# Start of 'Gem' code
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
# End of 'gem' code

# Our app code

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

# Our wrapper
module GearWrapper
  def self.gear(chainring:, cog:, wheel:)
    Gear.new(chainring, cog, wheel)
  end
end

# Try to run it)
gear = GearWrapper.gear(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5))
puts gear.gear_inches
# It works, and looks pretty cool :)

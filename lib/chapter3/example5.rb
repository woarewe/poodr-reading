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

# Dependency elimination
# If we will change arguments order in Gear#initialize next code will not work
# puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
# But we can using hashes for arguments initialization
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args = {})
    @chainring = args.fetch(:chainring)
    @cog = args.fetch(:cog)
    @wheel = args.fetch(:wheel)
  end

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

puts 'Example with hash like arguments store'
puts Gear.new(chainring: 52, wheel: Wheel.new(26, 1.5), cog: 10).gear_inches

# But ruby has better solution from the box
# Keyword arguments)))

class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring:, cog:, wheel:)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

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

puts 'Example with keyword arguments'
puts Gear.new(chainring: 52, wheel: Wheel.new(26, 1.5), cog: 10).gear_inches

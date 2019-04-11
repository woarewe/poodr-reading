# frozen_string_literal: true

# Example how we can reverse dependency direction
# In previous example class Gear depend from class Wheal and method 'diameter'
# Now we change situation, let's do code

class Gear
  attr_accessor :chainring, :cog

  def initialize(chainring:, cog:)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches(diameter)
    ratio * diameter
  end
end

class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim:, tire:, chainring:, cog:)
    @rim = rim
    @tire = tire
    @gear = Gear.new(chainring: chainring, cog: cog)
  end

  def diameter
    rim + (tire * 2)
  end

  # Now method gear_inches is method of Wheel instance
  # And class Wheel depend from class Gear
  def gear_inches
    gear.gear_inches(diameter)
  end
end

puts 'Run reversed dependency example'
puts Wheel.new(rim: 26, tire: 1.5, chainring: 52, cog: 11).gear_inches

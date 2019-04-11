# frozen_string_literal: true

# This class has 4 unnecessary dependencies
class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  # Here:
  # 1) Another class name: Class Gear expects class by name Wheel presence
  # 2) Method name: class Gear expects that Wheel instance has method 'diameter'
  # 3) Arguments: Gear know, that Wheel.new requires 'rim' and 'tire'
  # 4) Arguments order: Gear know, that Wheel.new expects that first argument will be 'rim', second - 'tire'
  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

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



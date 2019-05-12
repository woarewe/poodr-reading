# frozen_string_literal: true

require 'forwardable'

class Bicycle
  attr_reader :size, :parts

  def initialize(size: nil, parts: nil)
    @size = size
    @parts = parts
  end

  def spares
    parts.spares
  end
end

class Parts
  extend Forwardable
  include Enumerable

  attr_reader :parts
  def_delegators :parts, :size, :each

  def initialize(*parts)
    @parts = parts
  end

  def spares
    select { |part| part.needs_spare? }
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(name: nil, description: nil, needs_spare: true)
    @name = name
    @description = description
    @needs_spare = needs_spare
  end

  def needs_spare?
    needs_spare
  end
end

chain = Part.new(name: 'chain', description: '10-speed')
road_tire = Part.new(name: 'tire_size', description: '23')
tape = Part.new(name: 'tape_color', description: 'red')
mountain_tire = Part.new(name: 'tire_size', description: 'red')
rear_shock = Part.new(name: 'rear_shock', description: 'Fox')

front_shock =
  Part.new(
    name: 'front_shock',
    description: 'Manitou',
    needs_spare: false
  )

road_bike_parts = Parts.new(chain, road_tire, tape)
road_bike = Bicycle.new(size: 'L', parts: road_bike_parts)

puts road_bike.parts.size
puts road_bike.spares.size

mountain_parts = Parts.new(chain, mountain_tire, front_shock, rear_shock)
mountain_bike = Bicycle.new(size: 'L', parts: mountain_parts)

puts mountain_bike.parts.size
puts mountain_bike.spares.size

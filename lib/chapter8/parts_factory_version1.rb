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

road_config = [
  %w[chain 10-speed],
  %w[tire_size 23],
  %w[tape_color red]
]

mountain_config = [
  %w[chain 10-seed],
  %w[tire_size 2.1],
  %w[front_shock Manitou] + Array(false),
  %w[rear_shock Fox]
]

module PartsFactory
  def self.build(config, part_class = Part, parts_class = Parts)
    parts_class.new(
      config.map do |part_config|
        part_class.new(
          name: part_config[0],
          description: part_config[1],
          needs_spare: part_config.fetch(2, true)
        )
      end
    )
  end
end

mountain_parts = PartsFactory.build(mountain_config)
p mountain_parts

road_parts = PartsFactory.build(road_config)
p road_parts

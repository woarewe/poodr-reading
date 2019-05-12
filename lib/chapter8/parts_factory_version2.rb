# frozen_string_literal: true

require 'forwardable'
require 'ostruct'

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
    select(&:needs_spare)
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
  def self.build(config, parts_class: Parts)
    parts_class.new(*config.map(&method(:create_part)))
  end

  def self.create_part(config)
    OpenStruct.new(
      name: config[0],
      description: config[1],
      needs_spare: config.fetch(2, true)
    )
  end
end

mountain_parts = PartsFactory.build(mountain_config)
p mountain_parts

road_parts = PartsFactory.build(road_config)
p road_parts

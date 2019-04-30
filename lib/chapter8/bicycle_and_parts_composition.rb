# frozen_string_literal: true

class Bicycle
  attr_reader :size, :parts

  def initialize(size:, parts:)
    @size = size
    @parts = parts
  end

  def spares
    parts.spares
  end
end

class Parts
  attr_reader :chain, :tire_size

  def initialize(chain: nil, tire_size: nil, **args)
    @chain = chain || default_chain
    @tire_size = tire_size || default_tire_size
    post_initialize(args)
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain
    }.merge(local_spares)
  end

  def default_tire_size
    raise NotImplementedError
  end

  def post_initialize(**); end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(tape_color:, **)
    @tape_color = tape_color
  end

  def local_spares
    { tape_clor: tape_color }
  end

  def default_tire_size
    '23'
  end
end

class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(front_shock: nil, rear_shock: nil, **)
    @front_shock = front_shock
    @rear_shock = rear_shock
  end

  def local_spares
    { rear_shock: rear_shock }
  end

  def default_tire_size
    '2.1'
  end
end

road_bike = Bicycle.new(
  size: 'L',
  parts: RoadBikeParts.new(tape_color: 'red')
)

p road_bike.size
p road_bike.spares

mountain_bike = Bicycle.new(
  size: 'L',
  parts: MountainBikeParts.new(rear_shock: 'Fox')
)

p mountain_bike.size
p mountain_bike.spares

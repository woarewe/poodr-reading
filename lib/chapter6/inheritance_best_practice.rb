# frozen_string_literal: true

class Bicycle
  attr_reader :size, :chain, :tire_size

  # Use method for default values
  # Use template method pattern
  # in this class it is two methods:
  # Bicycle#default_chain
  # Bicycle#default_tire_size
  # This methods will be called in children classes but with their own specific realization and logic
  # If template method doesn't have base default logic raise NotImplemented Error
  # Decouple classes and subclasses using hook methods
  def initialize(size: nil, chain: nil, tire_size: nil, **args)
    @size = size
    # This method will be called into
    @chain = chain || default_chain
    @tire_size = tire_size || default_tire_size
    # This is hook method
    # Why I should do like that?
    # 1) You don't need more call in base classes super, super, super
    # 2) Base initialization logic is only in base initialize
    # you can if you need additional initialization just redefine post_initialize method :)
    # It's very pretty simple and very useful :)
    post_initialize(args.merge(size: size, chain: chain, tire_size: tire_size))
  end

  def spares
    { tire_size: tire_size, chain: chain }.merge(local_spares)
  end

  # If your method in base class should't work raise NotImplementedError
  def default_tire_size
    raise NotImplementedError
  end

  def post_initialize(**args); end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(tape_color:, **args)
    @tape_color = tape_color
  end

  def local_spares
    { tape_color: tape_color }
  end

  def default_tire_size
    '23'
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def post_initialize(front_shock:, rear_shock:)
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

class RecumbentBike < Bicycle
  attr_reader :flag

  def post_initialize(flag:, **args)
    @flag = flag
  end

  def local_spares
    { flag: flag }
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(flag: 'tall and orange')
p bent.spares

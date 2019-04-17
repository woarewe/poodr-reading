class Mechanic
  def prepare_trip(_trip)
    puts 'Bicycles of trip are prepared'
  end
end

class EquipmentMaster
  def prepare_trip(_trip)
    puts 'Equipment of trip are prepared'
  end
end

class Instructor
  def prepare_trip(_trip)
    puts 'Users of trip are prepared'
  end
end

class Trip
  attr_reader :bicycles
  attr_reader :equipment
  attr_reader :users

  def initialize(bicycles: nil, equipment: nil, users: nil)
    @bicycles = bicycles
    @equipment = equipment
    @users = users
  end

  # The best solution is Duck Typing)))
  # I don't know how prepares prepare trip
  # You trust them :)
  def prepare(*preparers)
    preparers.each { |preparer| preparer.prepare_trip(self) }
  end
end

# Just test
puts 'Pretty example with duck typing 😍🤘'
trip = Trip.new
trip.prepare(*[Mechanic, EquipmentMaster, Instructor].map(&:new))

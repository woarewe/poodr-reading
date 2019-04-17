class Mechanic
  def prepare_bicycles(_bicycles)
    puts 'Bicycles are prepared'
  end
end

class EquipmentMaster
  def prepare_equipment(_equipment)
    puts 'Equipment are prepared'
  end
end

class Instructor
  def prepare_users(_users)
    puts 'Users are prepared'
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

  # Bad, you have dependencies from class names
  def prepare(preparer)
    case preparer
    when Mechanic
      preparer.prepare_bicycles(bicycles)
    when EquipmentMaster
      preparer.prepare_equipment(equipment)
    when Instructor
      preparer.prepare_users(users)
    end
  end
end

# Just test

puts 'Example of code with dependencies from class names'
trip = Trip.new
[Mechanic, EquipmentMaster, Instructor].each { |klass| trip.prepare(klass.new) }

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

  # Here you don't have dependencies from class names, but it is not better :(
  # Your class Trip know HOW other classes prepare HIMSELF, it's messy
  def prepare(preparer)
    if preparer.respond_to?(:prepare_bicycles)
      preparer.prepare_bicycles(bicycles)
    elsif preparer.respond_to?(:prepare_equipment)
      preparer.prepare_equipment(equipment)
    elsif preparer.respond_to?(:prepare_users)
      preparer.prepare_users(users)
    end
  end
end

# Just test
puts 'Example of code with dependencies from class behavior'
trip = Trip.new
[Mechanic, EquipmentMaster, Instructor].each { |klass| trip.prepare(klass.new) }

require_relative 'bike'

class DockingStation

  def release_bike
    Bike.new
  end

  def empty?
    true
  end

  def dock(bike)
  end
end
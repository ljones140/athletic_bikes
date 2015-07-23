require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    raise "No bikes available" if @bikes.empty?
    @bikes.pop
  end

  def empty?
    true
  end

  def dock bike
    raise "Capacity full" if @bikes.count >= 20
    @bikes << bike
  end
end
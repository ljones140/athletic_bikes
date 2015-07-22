require_relative 'bike'

class DockingStation
  def release_bike
    fail "No Bikes Available"
  end

  def dock(bike)
    @bike = bike
  end
end
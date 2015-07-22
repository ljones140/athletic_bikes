require 'docking_station'

describe DockingStation do
  describe '#release_bike' do
    it 'should have an empty docking station by default' do
      expect {subject.release_bike}.to raise_error "No Bikes Available"
    end
  end

  it 'releases bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'docks bikes' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'expects one bike to enter after docking' do
    subject.dock(Bike.new)
    bike = subject.release_bike
  end
end
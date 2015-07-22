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
end
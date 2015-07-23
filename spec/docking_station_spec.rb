require 'docking_station'

describe DockingStation do

  it "responds to release bike" do
    expect(subject).to respond_to :release_bike
  end

  it "releases working bikes" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  describe "#release_bike" do
    it "releases a Bike" do
      expect(subject.release_bike).to be_a Bike
    end
  end
end

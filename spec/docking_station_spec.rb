require 'docking_station'

describe DockingStation do

  it "responds to release bike" do
    expect(subject).to respond_to :release_bike
  end

  it "responds to empty" do
    expect(subject).to respond_to :empty?
  end

  it "responds to empty" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "releases working bikes" do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "is empty by default" do
    expect(subject).to be_empty
  end

  describe "#release_bike" do
    it "raises an error when there are no bikes" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe "#dock" do
    it "raises error when full" do
      20.times{subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error 'Capacity full'
    end
  end

end

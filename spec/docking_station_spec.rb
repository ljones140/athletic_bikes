require 'docking_station'

describe DockingStation do
  #let(:generic_bike) {double (:bike)}
  let(:working_bike) {double(:bike, working?: true)}

  it "responds to release bike" do
    expect(subject).to respond_to :release_bike
  end

  it "responds to dock" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "releases working bikes" do
    # subject.dock generic_bike.stub(:working?).and_return(:true)
    subject.dock working_bike
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "checks capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "allows capacity to be specified at initialization" do
    random_number = rand(1..100)
    station = DockingStation.new(random_number)
    expect(station.capacity).to eq(random_number)
  end

  it "changes capacity" do
    random_number = rand(1..100)
    subject.capacity = random_number
    expect(subject.capacity).to eq random_number
  end


  describe "#release_bike" do

    it "raises an error when no bikes" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "raises error when attempt to release broken bike" do
      bike = Bike.new
      bike.report_broken
      station = DockingStation.new
      station.dock(bike)
      expect {station.release_bike}. to raise_error "No bikes available"
    end

  end

  describe "#dock" do

    it "raises error when full" do
      subject.capacity.times{subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error "Docking station full"
    end
  end

end

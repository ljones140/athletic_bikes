require 'bike'

describe Bike do
  it "responds to working" do
    expect(subject).to respond_to :working?
  end


  # it "report bike is broken" do
  #   expect(subject).to respond_to :report_broken
  # end

  it "returns true" do
    bike = Bike.new
    bike.report_broken
    expect(bike.broken).to be true
  end

end
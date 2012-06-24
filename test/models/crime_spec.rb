require "rspec"
require "models/crime"

describe "crime" do

  it "should initialize with type, description, location_description, latitude, longitude" do
    actual_crime = Crime.new({
        :type => "type",
        :description => "detail",
        :location_description => "location description",
        :latitude => "0",
        :longitude => "1"})

    actual_crime.type.should == "type"
    actual_crime.description.should == "detail"
    actual_crime.location_description.should == "location description"
    actual_crime.latitude.should == "0"
    actual_crime.longitude.should == "1"

  end

  it "should not initialize with any other values" do
    expect {Crime.new({:crap => "junk"})}.to raise_error(NoMethodError)
  end
end
require 'rspec'
require 'services/crime_service'

describe "Crime Service" do
  it "should retrieve crimes from the City of Chicago" do
    #JSON.parse(CrimeService.retrieve_raw_crime_data)["meta"]["view"]["name"].should eq("Crime Map - 2012")
  end
end
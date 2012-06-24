require 'rspec'
require 'stubs/crime_service_stub'

describe "Crime Service Stub" do
  it "should return a canned response for testing when the network is unavailable" do
    File.exists?(CrimeServiceStub::CRIMES_CACHE_FILENAME).should be_true
    CrimeServiceStub.get_crimes.size.should eq 10
  end
end
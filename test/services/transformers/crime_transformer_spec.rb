require "rspec"
require "services/transformers/crime_transformer"

describe "Chicago Crime Transformer" do

  it "should parse crimes returned from the Chicago data API into a collection of Crime objects" do
    crime_json = File.open("test/services/responses/crimes_response", 'r').read
    CrimeTransformer.parseCrimes(crime_json).size.should eq(10)
  end

  it "should parse an individual crime returned from the Chicago data API into our Crime object" do
    crime_json = [4781979, "8B2A6BD1-5DD4-42FB-B091-9AC8235F823B", 4781979, 1333579016, "21484", 1333579016, "21484", "{\n}", "HV100043", "8421394", "2012-01-01T00:15:00", "004XX E ILLINOIS ST", "0460", "BATTERY", "SIMPLE", "OTHER", false, false, "1834", "42", "08B", "1179466", "1903673", "2012", "2012-01-04T00:38:50", "41.89096452734874", "-87.61635775500169", [nil, "41.89096452734874", "-87.61635775500169", nil, false]]

    actual_crime = CrimeTransformer.parseCrime(crime_json)

    actual_crime.type.should eq "BATTERY"
    actual_crime.description.should eq "SIMPLE"
    actual_crime.location_description.should eq "OTHER"
    actual_crime.latitude.should eq "41.89096452734874"
    actual_crime.longitude.should eq "-87.61635775500169"
  end
end
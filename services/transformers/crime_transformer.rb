require 'json'
require 'models/crime'

class CrimeTransformer
  def self.parseCrime json
    Crime.new({
      :type => json[13],
      :description => json[14],
      :location_description => json[15],
      :latitude => json[25],
      :longitude => json[26]
    })
  end

  def self.parseCrimes raw_response_json
    JSON.parse(raw_response_json)["data"].map {|crime_json|
      parseCrime crime_json
    }
  end
end
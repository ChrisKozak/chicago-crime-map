require 'services/transformers/crime_transformer'

class CrimeService
  CRIMES_CACHE_FILENAME = "stubs/responses/crimes_response"

  def self.load_cached_crimes
    @crimes_response =  File.open(CRIMES_CACHE_FILENAME, 'r').read if @crimes_json.nil? && File.exists?(CRIMES_CACHE_FILENAME)
    can_crime_response if @crimes_response.empty?
    @crimes_response
  end

  def self.can_crime_response
    crimes_json = RestClient.get "https://data.cityofchicago.org/api/views/bj7p-98q2/rows.json", {:params => {"max_rows" => 10}}
    File.open(CRIMES_CACHE_FILENAME, 'w') {|f| f.write(crimes_json)}
  end


  def self.get_crimes
    CrimeTransformer.parseCrimes load_cached_crimes
  end
end
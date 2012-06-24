require 'sinatra'
require 'sinatra/partial'
require 'haml'
require 'services/crime_service'
require 'coffee-script'

get '/' do
  @crimes = CrimeService.get_crimes
  haml :index
end

get '/maps.js' do
  coffee :maps
end


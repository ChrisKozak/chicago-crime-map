class Crime
  attr_accessor :type, :description, :location_description, :latitude, :longitude

  def initialize(h)
    h.each {|k,v| send("#{k}=",v)}
  end
end
class Geocoder

attr_reader :lat, :lng
  def initialize(location)
    @lat = location[:results][0][:locations][0][:latLng][:lat]
    @lng = location[:results][0][:locations][0][:latLng][:lng]
  end
end

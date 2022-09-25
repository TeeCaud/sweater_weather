class Geocoder

attr_reader :lat, :lon
  def initialize(location)
    @lat = location[:results][0][:locations][0][:latLng][:lat]
    @lon = location[:results][0][:locations][0][:latLng][:lng]
  end
end

class GeocoderFacade
  class << self

    def get_coordinates(location)
      Geocoder.new(GeocoderService.get_coordinates(location))
    end
  end
end

class GeocoderFacade
  class << self

    def get_coordinates(location)
      Geocoder.new(GeocoderService.get_coordinates(location))
    end

    def get_directions(start_city, end_city)
      parsed_json = GeocoderService.get_directions(start_city, end_city)

      if parsed_json[:info][:messages].present?
        'Invalid Route'
      else
        parsed_json[:route][:formattedTime]
      end
    end
  end
end

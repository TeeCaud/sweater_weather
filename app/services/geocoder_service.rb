class GeocoderService
  class << self

    def get_coordinates(location)
      response = BaseService.geocoder_conn.get("/geocoding/v1/address?key=#{ENV['mapquest_api_key']}&location=#{location}", content_type: 'application/json')

      BaseService.get_json(response)
    end
  end
end

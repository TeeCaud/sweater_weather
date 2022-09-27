class GeocoderService
  class << self

    def get_coordinates(location)
      response = BaseService.geocoder_conn.get("/geocoding/v1/address?key=#{ENV['mapquest_api_key']}&location=#{location}", content_type: 'application/json')

      BaseService.get_json(response)
    end

    def get_directions(start_city, end_city)
      response = BaseService.geocoder_conn.get("/directions/v2/route?key=#{ENV['mapquest_api_key']}&from=#{start_city}&to=#{end_city}", content_type: 'application/json')

      BaseService.get_json(response)
    end
  end
end

class AccuWeatherService
  def get_location_by_ip(ip)
    url = 'http://dataservice.accuweather.com/locations/v1/cities/ipaddress'
    resp = Faraday.get(url, {apikey: ENV['accuweather_key'], q: ip }, {'Accept' => 'application/json'})
    json = JSON.parse(resp.body, symbolize_names: true)
    format(json)
  end

  def format(json)
    country_id = json[:Country][:ID]
    country_name = json[:Country][:LocalizedName]
    latitude = json[:GeoPosition][:Latitude]
    longitude = json[:GeoPosition][:Longitude]
    daylight_saving = json[:TimeZone][:IsDaylightSaving]
    processing_code = json[:Country][:LocalizedName] + ' - ' + json[:AdministrativeArea][:LocalizedName] + ' - ' + json[:LocalizedName]
    formatted_data = {
      'Country': {
        'ID': country_id,
        'LocalizedName': country_name
      },
      'latitude': latitude,
      'longitude': longitude,
      'IsDaylightSaving': daylight_saving,
      'processingCode': processing_code
    }
    formatted_data
  end
end

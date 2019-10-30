require './app/services/accuweather_service.rb'

class SearchController < ApplicationController
  def show
    service = AccuWeatherService.new
    render json: service.get_location_by_ip(params[:ip])
  end
end

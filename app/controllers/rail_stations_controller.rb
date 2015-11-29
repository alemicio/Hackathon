class RailStationsController < ApplicationController

  def index

    input_lat = params[:Lat]
    input_lng = params[:Lng]

    @rail_stations = RailStation.all

    @rail_stations.each do |rail_station|

      p lat = (rail_station.DO_X).to_digits
      p lng = (rail_station.DO_Y).to_digits
    end

    respond_to do |format|
      format.html
      format.json{
        render :json => @rail_stations.to_json
      }
    end
  end
end

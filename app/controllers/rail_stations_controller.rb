class RailStationsController < ApplicationController

  def index

    p input_lat = params[:Lat]
    p input_lng = params[:Lng]

    output_lat = nil
    output_lng = nil

    min_precedente = nil

    @rail_stations = RailStation.all

    @rail_stations.each do |rail_station|

      lat = (rail_station.DO_X)
      lng = (rail_station.DO_Y)

      min_corrente = Math.hypot(input_lat.to_d - lat, input_lng.to_d - lng)

      if(min_precedente === nil)
        min_precedente = min_corrente
        output_lat = lat
        output_lng = lng

      elsif(min_corrente < min_precedente)
        output_lat = lat
        output_lng = lng
      end

      output_lat
      output_lng
    end

    @output = Hash.new
    p @output[:lat] = output_lat
    p @output[:lng] = output_lng

    respond_to do |format|
      format.html
      format.json{
        render :json => @output.to_json
      }
    end
  end
end

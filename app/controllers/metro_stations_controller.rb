class MetroStationsController < ApplicationController

  def index
    p input_lat = params[:Lat]
    p input_lng = params[:Lng]


    output_lat = nil
    output_lng = nil

    min = nil

    @metro_stations = MetroStation.all

    @metro_stations.each do |metro_station|

      lng = (metro_station.DO_X)
      lat = (metro_station.DO_Y)

      distanza = Math.hypot(BigDecimal.new(input_lat) - lat, BigDecimal.new(input_lng) - lng)

      if(min === nil)
        min = distanza
        output_lat = lat
        output_lng = lng

      elsif(distanza < min)
        output_lat = lat
        output_lng = lng
        min = distanza
      end

      p output_lat
      p output_lng
    end

    metro_station = MetroStation.where(:DO_Y => (output_lat.to_f)-0.0000000000001..(output_lat.to_f)+0.0000000000001, :DO_X => (output_lng.to_f)-0.0000000000001..(output_lng.to_f)+0.0000000000001 ).first
    p metro_name = metro_station.FERMATA

    @output = Hash.new
    p @output[:lat] = output_lat
    p @output[:lng] = output_lng
    p @output[:metro_name] = metro_name

    respond_to do |format|
      format.html
      format.json{
        render :json => @output.to_json
      }
    end
  end
end


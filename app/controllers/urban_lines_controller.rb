class UrbanLinesController < ApplicationController

  def index

    p input_lat = params[:Lat]
    p input_lng = params[:Lng]

    output_lat = nil
    output_lng = nil

    min = nil

    @urban_lines = UrbanLine.all

    @urban_lines.each do |urban_line|

      lng = (urban_line.DO_X)
      lat = (urban_line.DO_Y)

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

      output_lat
      output_lng
    end

    line_station = UrbanLine.where(:DO_Y => (output_lat.to_f)-0.0000000000001..(output_lat.to_f)+0.0000000000001, :DO_X => (output_lng.to_f)-0.0000000000001..(output_lng.to_f)+0.0000000000001 ).first
    p line_station_name = line_station.UBICAZIONE

    @output = Hash.new
    p @output[:lat] = output_lat
    p @output[:lng] = output_lng
    p @output[:line_station_name] = line_station_name

    respond_to do |format|
      format.html
      format.json{
        render :json => @output.to_json
      }
    end
  end

end

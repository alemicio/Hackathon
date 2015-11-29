class UrbanLinesController < ApplicationController

  def index

    p input_lat = params[:Lat]
    p input_lng = params[:Lng]

    output_lat = nil
    output_lng = nil

    min = nil

    @urban_line = UrbanLine.all

    @urban_line.each do |urban_line|

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

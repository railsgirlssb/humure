module Api
  class LampsController < BaseController

    def show
      render_json_value(sensor_api.lamp_status)
    end

    def on
      render_json_value(sensor_api.switch_light_on)
    end

    def off
      render_json_value(sensor_api.switch_light_off)
    end

    def color
      render_json_value(sensor_api.lamp_color(params[:red], params[:green], params[:blue]))
    end

  end
end

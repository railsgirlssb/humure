module Api
  class TemperaturesController < BaseController

    def show
      render_json_value(sensor_api.temperature)
    end

  end
end

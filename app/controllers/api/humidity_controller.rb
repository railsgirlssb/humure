module Api
  class HumidityController < BaseController

    def show
      render_json_value(sensor_api.humidity)
    end

  end
end

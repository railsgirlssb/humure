module Api
  class BaseController < ApplicationController

    protected

    def sensor_api
      ::SensorApiService.new(sensor_name)
    end

    def sensor_name
      @sensor_name ||= (request.headers["X-Sensor"] || :fake)
    end

    def render_json_value(value)
      if value
        render json: { value: value }.to_json, status: :ok
      else
        render json: {}, status: :unprocessable_entity
      end
    end

  end
end

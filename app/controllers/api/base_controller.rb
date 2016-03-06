module Api
  class BaseController < ApplicationController

    protected

    def sensor_api
      ::FakeSensorApiService.new
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

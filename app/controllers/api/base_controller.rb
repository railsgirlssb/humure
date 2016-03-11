module Api
  class BaseController < ApplicationController

    protect_from_forgery with: :null_session

    before_action :authenticate

    protected

    def authenticate
      token.present? || render_unauthorized
    end

    def sensor_api
      ::SensorApiService.new(sensor_name: sensor_name, token: token)
    end

    def sensor_name
      @sensor_name ||= (request.headers["X-Sensor"] || :fake)
    end


    def token
      @token ||= request.headers["X-Token"]
    end

    def render_json_value(value)
      if value
        render json: { value: value }.to_json, status: :ok
      else
        render json: {}, status: :unprocessable_entity
      end
    end

    def render_unauthorized
      render json: 'Bad credentials', status: 401
    end

  end
end

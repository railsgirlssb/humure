class DashboardsController < ApplicationController

  def show
    @data = Sensor.includes(:sensor_changes).order('token ASC').decorate
  end

end

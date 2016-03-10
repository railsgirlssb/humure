class SensorApiService

  def humidity
    sensor_api.humidity
  end

  def temperature
    sensor_api.temperature
  end

  def lamp_status
    sensor_api.lamp_status
  end

  def switch_lamp_on
    sensor_api.switch_lamp_on
  end

  def switch_lamp_off
    sensor_api.switch_lamp_off
  end

  def change_lamp_color(red, green, blue)
    sensor_api.change_lamp_color(red, green, blue)
  end

  protected

  def sensor_api
    ::FakeSensorApiService.new
  end
end

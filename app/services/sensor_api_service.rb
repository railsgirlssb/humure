class SensorApiService

  attr_reader :sensor_name,
              :token

  def initialize(sensor_name:, token:)
    @sensor_name = sensor_name
    @token = token
  end

  def humidity
    cached_or_new_value_for(:humidity)
  end

  def temperature
    cached_or_new_value_for(:temperature)
  end

  def lamp_status
    cached_or_new_value_for(:lamp_status)
  end

  def switch_lamp_on
    new_value = sensor_api.switch_lamp_on
    update_value(:lamp_status, new_value)
  end

  def switch_lamp_off
    new_value = sensor_api.switch_lamp_off
    update_value(:lamp_status, new_value)
  end

  def change_lamp_color(red, green, blue)
    new_value = sensor_api.change_lamp_color(red, green, blue)
    update_value(:colors, new_value)
  end

  protected

  def sensor_api
    ::FakeSensorApiService.new
  end

  def sensor_model
    @sensor_model ||= begin
      Sensor.find_by(name: sensor_name, token: token) || Sensor.create!(name: sensor_name, token: token)
    end
  end

  def cached_or_new_value_for(field)
    return sensor_model.send(field) if !sensor_model.expired?(field)

    new_value = sensor_api.send(field)
    return nil if new_value.nil?

    sensor_model.update_field(field, new_value)
    sensor_model.send(field)
  end

  def update_value(field, value)
    sensor_model.update_field(field, value)
    value
  end

end

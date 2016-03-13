require 'test_helper'

class SensorTest < ActiveSupport::TestCase
  test "latest_sensor_change_for_field" do
    sensor = Sensor.new
    sensor_change = sensor.latest_sensor_change_for_field(:temperature)
    assert_equal true, sensor_change.new_record?


    sensor = Sensor.create(token: 'token', name: 'test')
    sensor_change = SensorChange.create(sensor_id: sensor.id, field: 'temperature')
    new_sensor_change = sensor.reload.latest_sensor_change_for_field(:temperature)
    assert_equal false, new_sensor_change.new_record?
    assert_equal true, new_sensor_change == sensor_change
  end
end

class FakeSensorApiService

  def temperature
    return NumberInRangeByTime.integer(seed_value: Time.now.to_i, range: 15..30, unit_duration: 3).to_f
  end

  def humidity
    return NumberInRangeByTime.integer(seed_value: Time.now.to_i, range: 30..70, unit_duration: 1)
  end

  def lamp_status
    'off'
 end

  def switch_lamp_on
    "on"
  end

  def switch_lamp_off
    "off"
  end

  def change_lamp_color(red, green, blue)
    [240,65,36]
  end

end

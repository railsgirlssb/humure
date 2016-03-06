class FakeSensorApiService

  def temperature
    24.50
  end

  def humidity
    65
  end

  def lamp_status
    'off'
 end

  def switch_light_on
    "on"
  end

  def switch_light_off
    "off"
  end

  def lamp_color(red, green, blue)
    [240,65,36]
  end

end

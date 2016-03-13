class SensorChangeDecorator < Draper::Decorator
  delegate_all

  def humidity
    source.value.to_s + '%'
  end

  def temperature
    source.value.to_s + '°C'
  end

  def lamp_icon
    if source.value == 'on'
      h.content_tag(:i, '', class: 'fa fa-lightbulb-o fa-2x', style: "color: #{color}")
    else
      h.content_tag(:span, class: 'fa-stack fa-lg') do
        h.content_tag(:i, '', class: 'fa fa-lightbulb-o fa-stack-1x') +
          h.content_tag(:i, '', class: 'fa fa-ban fa-stack-2x text-danger')
      end
    end
  end


  protected

    def color
      sensor_change = source.sensor.latest_sensor_change_for_field(:colors)
      colors = sensor_change.value? ? eval(sensor_change.value) : [255, 244, 229]

      RgbToHexService.convert(colors[0], colors[1], colors[2])
    end

    # def humidity_color
    #   value = source[:humidity].to_i

    #   if value < 35
    #     '#F04124' # red
    #   elsif (value >= 35 && value < 40) || (value > 60 && value <= 65)
    #     '#FFAE00' # yellow
    #   elsif value >= 40 && value <= 60
    #     '#299d54' # green
    #   elsif value > 65
    #     '#2199e8' # blue
    #   end
    # end

end

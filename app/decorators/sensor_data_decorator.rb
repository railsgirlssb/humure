class SensorDataDecorator < Draper::Decorator
  delegate_all

  def team
    source[:team]
  end

  def display_humidity
    source[:humidity].to_s + '%'
  end

  def display_temperature
    source[:temperature].to_s + '°C'
  end

  def lamp_icon
    if source[:lamp] == true
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
      RgbToHexService.convert(source[:red], source[:green], source[:blue])
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

class SensorDecorator < Draper::Decorator
  delegate_all

  def decorated_sensor_changes
    source.sensor_changes.decorate
  end

  def temperature
    decorated_field('temperature').temperature
  end

  def humidity
    decorated_field('humidity').humidity
  end

  def lamp_icon
    decorated_field('lamp_status').lamp_icon
  end

  def temperature_chart
    @temperature_chart = LazyHighCharts::HighChart.new('line') do |f|
      f.title(text: 'Temperatur')
      f.xAxis(categories: ['09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'])
      f.yAxis [{ title: { text: 'Temperature (°C)' } }]

      f.plot_options({ line: { dataLabels: { enabled: true }, enableMouseTracking: false }})

      f.series(name: 'Team A', data: [3, 4, 5, 6, 7, 8, 9, 4, 2, 7, 3, 6, 1, 0])
    end

    id = "temperature_chart_#{source.id}"
    h.content_tag(:div, '', id: id)

    h.high_chart(id, @temperature_chart)
  end


  private

  def decorated_field(field)
    source.latest_sensor_change_for_field(field).decorate
  end

end

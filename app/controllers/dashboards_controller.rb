class DashboardsController < ApplicationController

  def show
    data = [
      SensorData.new(team: 'Team A', humidity: 83, temperature: 25.1, lamp: false, red: nil, green: nil, blue: nil),
      SensorData.new(team: 'Team B', humidity: 20, temperature: 18.9, lamp: true, red: 255, green: 174, blue: 0),
      SensorData.new(team: 'Team C', humidity: 55, temperature: 21.4, lamp: true, red: 240, green: 65, blue: 36),
      SensorData.new(team: 'Team D', humidity: 37, temperature: 16.7, lamp: true, red: 33, green: 153, blue: 232)
    ]

    @data = data.collect { |data| SensorDataDecorator.decorate(data) }
  end

end

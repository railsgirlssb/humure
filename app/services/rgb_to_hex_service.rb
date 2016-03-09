class RgbToHexService

  attr_reader :red,
              :green,
              :blue

  class << self

    def convert(red, green, blue)
      self.new(red, green, blue).convert
    end

  end


  def initialize(red, green, blue)
    @red   = red
    @green = green
    @blue  = blue
  end

  def convert
    format(collect_values)
  end


  protected

    def collect_values
      [red, green, blue].collect do |value|
        value_to_hex(value)
      end
    end

    def value_to_hex(value)
      value.to_i.to_s(16).rjust(2, '0')
    end

    def format(values)
      '#' + values.join.upcase
    end

end

class SensorChange < ApplicationRecord

  belongs_to :sensor


  serialize :colors, Array


  validates :sensor_id, presence: true
  validates :field, presence: true


  scope :with_field_updated_at_desc, ->(field) {
    where(field: field).order('updated_at DESC')
  }


  class << self

    def create_for_field(field, sensor_id, value)
      sensor_change = SensorChange.new(sensor_id: sensor_id, field: field)
      sensor_change.value = value
      sensor_change.save

      sensor_change
    end

  end


  def expired?
    !value? || (updated_at <= 3.seconds.ago)
  end

end

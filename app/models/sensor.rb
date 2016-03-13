class Sensor < ApplicationRecord

  has_many :sensor_changes, dependent: :destroy


  validates :name, presence: true
  validates :token, presence: true


  def latest_sensor_change_for_field(field)
    sensor_changes.with_field_updated_at_desc(field).first
    sensor_change = sensor_changes.where(field: field).order('updated_at DESC').first

    sensor_change || SensorChange.new(sensor_id: id, field: field)
  end

end

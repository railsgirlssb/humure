class Sensor < ApplicationRecord
  validates :name, presence: true
  validates :token, presence: true

  serialize :colors, Array

  def expired?(field)
    self.send(field).blank? || (self.send("#{field}_updated_at") <= 3.seconds.ago)
  end

  def update_field(field, new_value)
    self.send("#{field}=", new_value)
    self.send("#{field}_updated_at=", DateTime.now)
    save
  end
end

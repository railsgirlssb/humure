class CreateSensorChanges < ActiveRecord::Migration[5.0]
  def change
    create_table :sensor_changes do |t|
      t.timestamps

      t.integer :sensor_id
      t.string  :field
      t.string  :value
    end
  end
end

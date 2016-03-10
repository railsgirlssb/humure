class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.timestamps
      t.string :name, null: false
      t.string :token, null: false

      t.integer :humidity
      t.datetime :humidity_updated_at

      t.float :temperature
      t.datetime :temperature_updated_at

      t.string :lamp_status
      t.datetime :lamp_status_updated_at

      t.string :colors
      t.datetime :colors_updated_at
    end
  end
end

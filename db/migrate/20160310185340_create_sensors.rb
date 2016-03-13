class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.timestamps

      t.string :name,  null: false
      t.string :token, null: false
    end
  end
end

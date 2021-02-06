class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string   :common_name
      t.string   :scientific_name
      t.string   :watering_schedule
      t.string   :rotation_schedule
      t.string   :fertilization_schedule
      t.string   :location
      t.string   :size
      t.string   :category
      t.integer  :dweller_id
      t.timestamps
    end
  end
end

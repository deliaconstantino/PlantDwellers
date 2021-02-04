class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :hardiness_zone
    end
  end
end

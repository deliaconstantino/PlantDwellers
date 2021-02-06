class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :hardiness_zone
      t.string  :city
      t.string  :nickname
    end
  end
end

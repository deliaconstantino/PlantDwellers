class DropTableHomes < ActiveRecord::Migration
  def change
    drop_table :homes
  end
end

class AddHomeIdForeignKeyBackToDwellers < ActiveRecord::Migration
  def change
    add_column :dwellers, :home_id, :integer
  end
end

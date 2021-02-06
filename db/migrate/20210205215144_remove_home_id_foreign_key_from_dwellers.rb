class RemoveHomeIdForeignKeyFromDwellers < ActiveRecord::Migration
  def change
    remove_reference :dwellers, :home, index: true, foreign_key: true
  end
end

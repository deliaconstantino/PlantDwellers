class AddColumnToHomesTable < ActiveRecord::Migration
  def change
    add_column :homes, :nickname, :string
    add_column :homes, :address, :string
  end
end

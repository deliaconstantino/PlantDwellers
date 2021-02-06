class ChangeHomesColumnAddressToCity < ActiveRecord::Migration
  def change
    change_column :homes, :address, :city
  end
end

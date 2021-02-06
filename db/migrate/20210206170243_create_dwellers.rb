class CreateDwellers < ActiveRecord::Migration
  def change
    create_table :dwellers do |t|
      t.string  :name
      t.string  :email
      t.string  :username
      t.string  :password_digest
      t.string  :favorite_plant
      t.integer :home_id
    end
  end
end

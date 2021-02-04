class Home < ActiveRecord::Base
  has_many :dwellers
  has_many :plants, through: :dwellers
end

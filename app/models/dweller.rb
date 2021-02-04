class Dweller < ActiveRecord::Base
  has_secure_password
  belongs_to :home
  has_many :plants
end

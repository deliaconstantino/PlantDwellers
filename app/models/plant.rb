class Plant < ActiveRecord::Base
  belongs_to :dweller
  has_one :home, through: :dweller
end

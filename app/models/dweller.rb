class Dweller < ActiveRecord::Base
  has_secure_password
  belongs_to :home
  has_many :plants

  validates :name, :email, :username, presence: true
  validates :email, :username, uniqueness: true
end

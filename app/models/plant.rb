class Plant < ActiveRecord::Base
  serialize :watering_schedule
  serialize :rotation_schedule
  serialize :fertilization_schedule

  belongs_to :dweller
  has_one :home, through: :dweller
end

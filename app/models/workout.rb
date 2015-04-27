class Workout < ActiveRecord::Base
  belongs_to :simplifit_user
	belongs_to :workout_category

  validates_presence_of :workout_category_id
  validates_presence_of :duration
end
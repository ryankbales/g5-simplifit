class Workout < ActiveRecord::Base
  belongs_to :simplifit_user
	belongs_to :workout_category
end
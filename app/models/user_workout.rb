class UserWorkout < ActiveRecord::Base
	belongs_to :workout 
	belongs_to :simplifit_user
end
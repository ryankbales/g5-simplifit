class WorkoutCategory < ActiveRecord::Base
	has_many :workouts
end
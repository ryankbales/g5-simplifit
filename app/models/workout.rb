class Workout < ActiveRecord::Base
	belongs_to :workout_type
	has_many :user_workouts
	has_many :simplifit_users, through: :user_workouts
end
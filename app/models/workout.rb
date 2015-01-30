class Workout < ActiveRecord::Base
	has_many :simplifit_users, through: :user_workouts
end
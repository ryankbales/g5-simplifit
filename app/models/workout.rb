class Workout < ActiveRecord::Base
	has_many :users, through: user_workouts
end
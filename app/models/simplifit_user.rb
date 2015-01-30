class SimplifitUser < ActiveRecord::Base
	belongs_to :department
	belongs_to :grand_prize_winner


	has_many :workouts, through: :user_workouts
	has_many :raffles, through: :user_raffle_winners

end
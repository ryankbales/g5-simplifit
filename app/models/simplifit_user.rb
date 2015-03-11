class SimplifitUser < ActiveRecord::Base
	belongs_to :department
	belongs_to :grand_prize_winner
  belongs_to :user_raffle_winners

	has_many :workouts
	has_many :raffles, through: :user_raffle_winners

end
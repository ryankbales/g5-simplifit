class SimplifitUser < ActiveRecord::Base
	include Gravtastic
  gravtastic :user_email

	belongs_to :department
	belongs_to :grand_prize_winner

	has_many :user_workouts
	has_many :workouts, through: :user_workouts
	has_many :raffles, through: :user_raffle_winners


end
class Raffle < ActiveRecord::Base
	has_many :simplifit_users, through: :user_raffle_winners
end
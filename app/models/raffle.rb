class Raffle < ActiveRecord::Base
	has_many :users, through: :user_raffle_winners
end
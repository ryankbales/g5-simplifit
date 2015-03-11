class UserRaffleWinners < ActiveRecord::Base
	belongs_to :simplifit_user 
	belongs_to :raffle
end
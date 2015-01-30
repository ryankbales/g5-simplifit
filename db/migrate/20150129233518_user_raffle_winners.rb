class UserRaffleWinners < ActiveRecord::Migration
  def change
  	create_table :user_raffle_winners do |t|
  		t.integer :simplifit_user_id
  		t.integer :raffle_id
  	end
  end
end

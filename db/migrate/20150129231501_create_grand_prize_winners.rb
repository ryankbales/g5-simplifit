class CreateGrandPrizeWinners < ActiveRecord::Migration
  def change
    create_table :grand_prize_winners do |t|
    	t.integer :simplifit_user_id
    	t.datetime :date
    end
  end
end

class ReallyRenameColumnInGrandPrizes < ActiveRecord::Migration
  def change
  	rename_column :grand_prize_winners, :date, :created_at
  end
end

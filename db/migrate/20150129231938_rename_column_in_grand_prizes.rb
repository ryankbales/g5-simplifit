class RenameColumnInGrandPrizes < ActiveRecord::Migration
  def change
  	def self.up
	    rename_column :grand_prize_winners, :date, :created_at
	  end

	  def self.down
	    rename_column :grand_prize_winners, :created_at, :date
	  end
  end
end

class AddAssociationColumnsToWorkoutAndUser < ActiveRecord::Migration
  def change
    add_column :simplifit_users, :grand_prize_winner_id, :integer
  end
end

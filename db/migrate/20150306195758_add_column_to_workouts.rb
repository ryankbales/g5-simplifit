class AddColumnToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :simplifit_user_id, :integer
  end
end

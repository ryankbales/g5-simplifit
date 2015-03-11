class DropUserWorkouts < ActiveRecord::Migration
  def change
    drop_table :user_workouts
  end
end

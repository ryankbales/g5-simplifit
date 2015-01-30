class CreateUserWorkouts < ActiveRecord::Migration
  def change
    create_table :user_workouts do |t|
    	t.integer :simplifit_user_id
    	t.integer :workout_id
    end
  end
end

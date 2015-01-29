class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
    	t.string :type
    	t.datetime :created_at
    	t.integer :duration
    end
  end
end

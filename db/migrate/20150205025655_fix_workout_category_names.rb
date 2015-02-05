class FixWorkoutCategoryNames < ActiveRecord::Migration
  def change
  	rename_column :workout_types, :type, :category
  	rename_table :workout_types, :workout_categories
  	rename_column :workouts, :type_id, :workout_category_id
  end
end

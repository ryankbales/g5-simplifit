class RenameAndChangeDataTypeForWorkoutType < ActiveRecord::Migration
  def change
  	change_column :workouts, :type,  :integer
  	rename_column :workouts, :type, :type_id
  end
end

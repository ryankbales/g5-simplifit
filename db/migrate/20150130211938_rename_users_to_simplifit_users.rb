class RenameUsersToSimplifitUsers < ActiveRecord::Migration
  def change
	  rename_table :users, :simplifit_users
  end
end

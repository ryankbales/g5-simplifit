class AddUserAvatarColumn < ActiveRecord::Migration
  def change
  	add_column :simplifit_users, :user_avatar, :string
  end
end

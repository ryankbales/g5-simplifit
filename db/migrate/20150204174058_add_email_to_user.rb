class AddEmailToUser < ActiveRecord::Migration
  def change
  	add_column :simplifit_users, :user_email, :string
  end
end

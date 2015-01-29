class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.integer :age
    	t.string :gender
    	t.integer :department_id
    	t.datetime :created_at
    	t.datetime :updated_at
    end
  end
end

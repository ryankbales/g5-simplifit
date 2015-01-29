class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
    	t.datetime :created_at
    end
  end
end

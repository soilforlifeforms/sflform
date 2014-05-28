class AddPasswordDidgestToTrainers < ActiveRecord::Migration
 
  def up
  	add_column "trainers", "first_name", :string
  	add_column "trainers", "last_name", :string
  	add_column "trainers", "cell phone number", :integer
  	add_column "trainers", "password_digest", :string
  end
  def down
  	remove_column "trainers", "first_name", :string
  	remove_column "trainers", "last_name", :string
  	remove_column "trainers", "cell phone number", :integer
  	remove_column "trainers", "password_digest", :string
  end
end

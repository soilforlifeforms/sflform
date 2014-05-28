class AddUserNameToTrainers < ActiveRecord::Migration
  def up
  	add_column "trainers", "user_name", :string
  end
  def down
  	 remove_column "trainers", "user_name", :string
  end
end

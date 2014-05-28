class RemoveFirstNameFromTrainers < ActiveRecord::Migration
  def up
  	remove_column "trainers", "first_name", :string
  end
  	
  	def down
  	add_column "trainers", "first_name", :string
  end
end

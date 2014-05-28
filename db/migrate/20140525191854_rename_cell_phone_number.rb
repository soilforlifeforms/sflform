class RenameCellPhoneNumber < ActiveRecord::Migration
  def up
  	rename_column "trainers", "cell phone number", "cell_phone_number"
  end
  def down
  	rename_column "trainers", "cell_phone_number", "cell phone number"
  end
end

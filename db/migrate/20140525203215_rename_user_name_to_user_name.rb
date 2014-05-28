class RenameUserNameToUserName < ActiveRecord::Migration
  def up
  	rename_column "trainers", "user_name", "username"
  end
  def down
  	rename_column "trainers", "username", "user_name"
  end
end

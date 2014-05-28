class RanameNameToTrainerName < ActiveRecord::Migration
  def change
  		rename_column :trainers, :name , :trainer_name
  end
end

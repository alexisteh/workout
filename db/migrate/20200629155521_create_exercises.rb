class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :exercisecat_id 
      t.integer :user_id 
    end

  end
end 
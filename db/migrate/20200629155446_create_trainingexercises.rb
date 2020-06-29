class CreateTrainingexercises < ActiveRecord::Migration[6.0]
  def change
    create_table :trainingexercises do |t|
      t.integer :training_id 
      t.integer :exercise_id 
    end
  end
end

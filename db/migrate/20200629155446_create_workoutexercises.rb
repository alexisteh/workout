class CreateWorkoutexercises < ActiveRecord::Migration[6.0]
  def change
    create_table :workoutexercises do |t|
      t.integer :workout_id 
      t.integer :exercise_id 
    end
  end
end

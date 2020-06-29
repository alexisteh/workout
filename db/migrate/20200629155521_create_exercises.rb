class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :category
      t.integer :reps
      t.integer :sets
      t.integer :duration
    end

  end
end 
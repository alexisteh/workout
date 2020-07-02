class CreateExercisecats < ActiveRecord::Migration[6.0]
  def change
    create_table :exercisecats do |t|
      t.string :name 
    end
  end
end

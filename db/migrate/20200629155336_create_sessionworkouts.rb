class CreateSessionworkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :sessionworkouts do |t|
      t.integer :sesh_id
      t.integer :workout_id
      t.integer :order
      t.boolean :activated, default: false
    end
  end
end

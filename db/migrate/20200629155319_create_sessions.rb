class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.datetime :time 
      t.string :goals
      t.integer :user_id 
      t.integer :gym_id 
    end
  end
end

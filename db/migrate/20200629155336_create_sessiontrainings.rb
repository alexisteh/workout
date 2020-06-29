class CreateSessiontrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :sessiontrainings do |t|
      t.integer :sesh_id
      t.integer :training_id
    end
  end
end

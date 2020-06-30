class CreateGyms < ActiveRecord::Migration[6.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :address
      t.string :list_of_equipment
      t.integer :user_id 
    end
  end
end

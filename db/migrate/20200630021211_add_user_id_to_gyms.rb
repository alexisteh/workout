class AddUserIdToGyms < ActiveRecord::Migration[6.0]
  def change
    add_column :gyms, :user_id, :integer 
  end
end

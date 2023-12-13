class AddUserIdToFutsals < ActiveRecord::Migration[6.1]
  def change
    add_column :futsals, :user_id, :integer
  end
end

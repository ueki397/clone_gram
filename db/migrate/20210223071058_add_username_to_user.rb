class AddUsernameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string, null: false, unique: true
  end
end

class RemoveconfirmPasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :confirm_password
  end
end

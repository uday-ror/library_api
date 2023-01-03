class AddadminIdToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :admin_id, :integer
    add_column :plans, :admin_id, :integer
    rename_column :admins, :password, :password_digest

  end
end

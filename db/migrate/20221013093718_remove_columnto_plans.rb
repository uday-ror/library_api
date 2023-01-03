class RemoveColumntoPlans < ActiveRecord::Migration[7.0]
  def change
    remove_column :plans, :admin_id
  end
end

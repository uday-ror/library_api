class AddPlanToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :plans, foreign_key: true
  end
end

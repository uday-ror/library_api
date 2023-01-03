class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :plan_type
      t.integer :price
      t.integer :no_of_books

      t.timestamps
    end
  end
end

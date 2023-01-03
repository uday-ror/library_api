class CreateIssueBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_books do |t|
      t.integer :book_id
      t.integer :plan_id
      t.integer :user_id

      t.timestamps
    end
  end
end

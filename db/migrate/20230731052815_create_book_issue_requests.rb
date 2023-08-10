class CreateBookIssueRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :book_issue_requests do |t|
      t.integer :student_id
      t.integer :faculty_id
      t.integer :book_id
      t.string :status

      t.timestamps
    end
  end
end

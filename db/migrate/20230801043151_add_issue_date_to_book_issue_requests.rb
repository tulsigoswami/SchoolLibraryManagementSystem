class AddIssueDateToBookIssueRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :book_issue_requests, :issue_date, :date
  end
end

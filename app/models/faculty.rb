class Faculty < User
  validates :name, presence: true
  validates :email,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},presence: true, uniqueness: true

  validates :type, presence: true, inclusion: { in: %w[Faculty] }

  has_many :books, foreign_key: 'faculty_id', dependent: :destroy
  has_many :categories, through: :books
  has_one :image, as: :imageable, dependent: :destroy
  has_many :book_issue_requests, foreign_key: 'faculty_id'

  def delete_book(book_id)
    book = books.find_by(id:book_id)
    if book
      book.destroy
    return "Book deleted successfully"
    else
      return "Book not found with the given id"
    end
  end

  def update_book(book_id, book_attributes)
    book = books.find_by(id:book_id)
    if book
      book.update(book_attributes)
    return "Book updated successfully"
    else
      return "Book updation failed"
    end      
  end

  def update_book_issue_status(request_id, status)
    request = BookIssueRequest.find_by(id: request_id, faculty_id: id)
    if request
      b1 = BookIssueRequest.all
      if b1.pluck(:status).include?(status)
        request.update(status: status)
        puts "Status updated successfully."
      else
        puts "Invalid status"
      end
    else
      puts "Book issue request not found or not authorized to update."
    end
  end
end

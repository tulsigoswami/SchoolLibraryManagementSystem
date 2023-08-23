class Student < User
  validates :name, presence: true
   validates :email,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},presence: true
  validates :type, presence: true,inclusion: { in: %w[Student] }
   
  has_many :book_issue_requests, foreign_key: 'student_id'
  has_one :image, as: :imageable, dependent: :destroy

  def search_books_by_name(name)
    Book.where('name = ?',name)
  end

  def request_book(book_identifier)
    if book_identifier.class == Integer
      book = Book.find_by_id(book_identifier)
    else
      book = Book.find_by_name(book_identifier)
    end

    if book.nil?
      puts "Book not found."
      return
    end

    faculty = Faculty.first
    if book.quantity > 0 
      book_issue_requests.create!(book_id: book.id, status: 'issued',student_id:self.id,
      faculty_id:faculty.id, issue_date:Date.today)
      book.decrement!(:quantity)
      puts "Book issued to student: #{book.name}"
    else
      puts "Book is not available for issue at the moment."
      book_issue_requests.create!(book_id: book.id, status: 'requested',student_id:self.id,faculty_id:faculty.id)
    end
  end

  def submit_book(book_id)
    request = book_issue_requests.find_by(book_id: book_id, status: 'issued')
    return unless request
    request.update(status: 'submitted')
    book = Book.find(book_id)
    book.increment(:quantity)
  end
end

class BooksController < ApplicationController
  before_action :authorize_request, except:[:index,:show]
  before_action :authorize_faculty, only:[:create,:update,:destroy]
  def index
    books = Book.all
    binding.break
    render json: books
  end

  def create
    @book = Book.create(book_params)
    if @book.save
     render json: @book
    else
     render json: @book.errors.full_messages
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book
    @book.update(book_params)
    render json: @book
    end
  end

  def show
   @book = Book.find(params[:id])
   if @book
    render json: @book, serializer: BookSerializer
   end
  end

  def destroy
   @book = Book.find(params[:id])
   if @book.destroy
    render plain: "book deleted successfully"
   end
  end


  private
  def book_params
       params.permit(:name,:quantity,:faculty_id, :category_id)
  end

  def self.check_book_availability(book_id)
    @book = Book.find(book_id)
    if @book.quantity>0
      @book.decrement!(:quantity)
      true
    else
      false
    end
  end
end

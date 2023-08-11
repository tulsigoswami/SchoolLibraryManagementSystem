class BooksController < ApplicationController
  def index
    # @books=Book.find(params[:id])
    @books = Book.all
    render json: @books
  end

  def create
    @book = Book.create(name:params[:name],quantity:params[:quantity],category_id:params[:category_id],faculty_id:params[:faculty_id])
    if @book
    render json: @book
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book
    @book.update(name:params[:name])
    render json: @book
    else
    false
    end
  end

  def show
   @book = Book.find(params[:id])
   render json: @book.name
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   render json: @book
  end

  private
  def book_params
       params.require(:book).permit(:name,:quantity,:faculty_id, :category_id)
   end
end

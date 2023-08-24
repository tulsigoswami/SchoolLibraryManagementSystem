require 'users_controller.rb'
class BookIssueRequestsController < ApplicationController
    before_action :authorize_request
    before_action :authorize_faculty, except: :create
    def index
        @book_issue_requests = BookIssueRequest.all
        render json:@book_issue_requests
    end

    def show
     @book_issue_request = BookIssueRequest.where(student_id:params[:student_id])
     render json: @book_issue_request
    end

    def create
     @book_issue_request = BookIssueRequest.new(book_id:params[:book_id],student_id:params[:student_id],faculty_id:1,status:"requested")

      if @book_issue_request.save
          @book_id  = @book_issue_request.book_id
          if BooksController.check_book_availability(@book_id)
             @book_issue_request.update(book_id:params[:book_id],student_id:params[:student_id],faculty_id:1,status:"issued", issue_date:Date.today)

             render plain:'book issued successfully'
          else
             render plain: 'Book not available currently'
          end
      end
    end

    def update
      @book_issue_request = BookIssueRequest.find(params[:id])
      if @book_issue_request.update(book_request_issue_params)
        render "index" , plain: 'Request updated'
      end
    end

    private
    def book_request_issue_params
      params.permit(:book_id,:student_id,:status)
    end

end

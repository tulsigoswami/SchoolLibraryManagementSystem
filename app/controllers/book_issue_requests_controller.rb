class BookIssueRequestsController < ApplicationController

   def index
    if params[:status] =='issued'
      @book_issue_requests = BookIssueRequest.where(status:"issued")
      redirect_to @book_issue_request
      #render json:@book_issue_requests
    else
      @book_issue_requests = BookIssueRequest.where(status:"requested")
      # redirect_to @book_issue_request
      render json:@book_issue_requests
    end
   end

   def create
     @book_issue_request = BookIssueRequest.create(book_id:params[:book_id],student_id:params[:student_id],faculty_id:params[:faculty_id],status:params[:status])

     if @book_issue_request
      render json:@book_issue_request
     else
      render json:@book_issue_request
     end
   end

   # private

   # def book_issue_request_params
   #     params.require(:book_issue_request).permit(:faculty_id, :book_id,:student_id,:status)
   # end
end

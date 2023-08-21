class StudentsController < ApplicationController

  def index
   @student = Student.all
   render json: @student
  end

  def create
    @student = Student.create(student_params)
    if @student.save
     render json: @student
    else
     render json: @student.errors.full_messages
    end
  end

  def show
   @student = Student.find(params[:id])
   if @student
    render json: @student
   end
  end

  def destroy
   @student = Student.find(params[:id])
   if @student.destroy
    render plain: "student deleted successfully"
   end
  end

  private
  def student_params
       params.permit(:name,:email)
  end
end

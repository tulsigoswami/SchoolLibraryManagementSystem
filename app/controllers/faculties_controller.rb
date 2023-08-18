class FacultiesController < ApplicationController

  def index
   @faculty = Faculty.first
   render json: @faculty
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update(faculty_params)
      render plain: "Faculty information updated successfully"
    end
  end

  private

  def faculty_params
       params.permit(:name)
  end
end

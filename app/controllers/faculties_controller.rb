class FacultiesController < ApplicationController

  def index
    @faculty = Faculty.all
    render json: @faculty
  end

  private

  def faculty_params
       params.permit(:name)
  end
end

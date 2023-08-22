class FacultiesController < ApplicationController
  def index
    # @faculty = Faculty.first
    # render json: @faculty
     @faculty = Faculty.first
     profile = @faculty.picture_blob
     render json: profile
  end

  def faculty_profile
     @faculty = Faculty.first
     profile = @faculty.picture_blob

     render json: profile
  end

  private

  def faculty_params
       params.permit(:name)
  end
end

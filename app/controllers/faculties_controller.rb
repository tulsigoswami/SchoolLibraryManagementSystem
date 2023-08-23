class FacultiesController < ApplicationController
  def index
    @faculty = User.find(1)
    render json:@faculty
  end
end

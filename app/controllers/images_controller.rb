class ImagesController < ApplicationController

  def create
    @image = Image.create(image_params)
    render json: @image
  end

  def show
  @image = Image.where('imageable_id =  ? and imageable_type = ?',params[:imageable_id],params[:imageable_type])
   render json:@image
  end

  private
  def image_params
    params.permit(:url,:imageable_id,:imageable_type)
  end
end

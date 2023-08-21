class ImagesController < ApplicationController

  def create
    if check_image(params[:imageable_id])
      render plain:"Image already exist"
    else
      @image = Image.create(image_params)
      render json: @image
    end
  end

  def show
  @image = Image.where('imageable_id =  ? and imageable_type = ?',params[:imageable_id],params[:imageable_type])
   render json:@image
  end

  private
  def image_params
    params.permit(:url,:imageable_id,:imageable_type)
  end

  def check_image(imageable_id)
    @image = Image.find_by(imageable_id:imageable_id)
    if @image
      true
    else
      false
    end
  end
end

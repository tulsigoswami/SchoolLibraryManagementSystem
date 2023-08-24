class ImagesController < ApplicationController
  before_action :authorize_request,except: [:create_book_profile,:show]
  before_action :authorize_faculty, only: :index

  def index
    @image = Image.all.where(imageable_type:'User')
    render json: @image
  end

  def create
    if check_image(params[:imageable_id])
      render plain:"Image already exist"
    else
      @image = Image.create(image_params)
      render json: @image
    end
  end

  def create_book_profile
    if check_image(params[:imageable_id])
      render plain:"Image already exist"
    else
      @image = Image.create(image_params)
      render json: @image
    end
  end

  def show
  @image = Image.find_by(imageable_id:params[:imageable_id])
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

class CategoriesController < ApplicationController
  before_action :authorize_faculty, except: [:index, :show]
  def index
    @categories = Category.all
    render json: @categories
  end

  def update
    @category = Category.find(params[:id])
    if @category
    @category.update(name:params[:name])
    render json: @category
    end
  end

  def show
   @category = Category.find(params[:id])
   if @category
    render json: @category
   end
  end

  def destroy
   @category= Category.find(params[:id])
   if @category.destroy
    render plain: "category deleted successfully"
   end
  end

end

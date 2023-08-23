class UsersController < ApplicationController
  before_action :check_user, only: [:index]
  before_action :authorize_request,except: :create
  before_action :find_user, except: [:create, :index]

  def index
    @users = Student.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: @user
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to controller: :books, action: :index
  end

  private

  def find_user
    @user = User.find_by_name(params[:name])
    rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:picture, :name, :email, :password)
  end

  def check_user
      @user = User.find(params[:id])
      if @user.type=='Student'
        render plain: 'Acces denied, only allowed to faculty'
      end
  end
end

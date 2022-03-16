class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user, include: :items
  end

  def create
    user = User.create!(user_params)
    render json: user, status: :created
  end

  private
  def user_params
    params.permit(:name, :description, :price)
  end

end

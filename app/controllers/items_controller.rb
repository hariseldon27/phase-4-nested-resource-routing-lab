class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      new_item = user.items.create!(item_params)
    else
      new_item = Item.create!(item_params)
    end
    render json: new_item, include: :user, status: :created
  end


  private   
  def item_params
    params.permit(:name, :description, :price, :user_id)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
    
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:user, :name, :price, :description, :category_id, :condition_id,  :prefecture_id, :delivery_cost_id, :derivery_dete_id)
  end

end
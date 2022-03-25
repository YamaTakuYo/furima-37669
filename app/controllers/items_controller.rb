class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
    
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private
  def item_params
    params.require(:item).permit(:user, :name, :price, :description, :category_id, :condition_id,  :prefecture_id, :delivery_cost_id, :derivery_dete_id, :image)
  end

end
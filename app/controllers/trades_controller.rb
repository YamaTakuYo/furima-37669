class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @trade_buyer = TradeBuyer.new
  end
  
  def create
    @trade_buyer = TradeBuyer.new(trade_params)
    if @trade_buyer.valid?
      pay_item
      @trade_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def trade_params
    params.require(:trade_buyer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.trade.present?
  end
end

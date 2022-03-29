class TradesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @trade_buyer = TradeBuyer.new
  end
  
  def create
    @trade_buyer = TradeBuyer.new(trade_params)
    if @trade_buyer.valid?
      @trade_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def trade_params
    params.require(:trade_buyer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id])
  end

end

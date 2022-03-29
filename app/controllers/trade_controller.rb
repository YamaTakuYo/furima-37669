class TradeController < ApplicationController
  def index
    @trade = Trade.new
  end
  
  def create
    @trade = Trade.new(trade_params)
    if @trade.valid?
      pay_item
      @trade.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id])
  end

end

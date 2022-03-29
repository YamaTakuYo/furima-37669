class TradeController < ApplicationController
  def index
    @trade = Trade.new
  end
  
  def create
    @trade = Trade.new(trade_params)
  end



end

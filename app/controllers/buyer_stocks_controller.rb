class BuyerStocksController < ApplicationController
  before_action :set_buyer_stock, only: %i[ show edit update destroy ]

  def create
    stock = Stock.find(params[:stock])
    # stock.bought_by = current_buyer.id
    @buyer_stock = BuyerStock.create(buyer_id: current_buyer.id, stock_id: stock.id)
    flash[:notice] = "Stock #{stock.name} was successfully bought."
    redirect_to buyer_portfolio_path
  end

  def show
  end

  private

  def set_buyer_stock
    @buyer_stock = Stock.find(params[:id])
  end

  # def buyer_stock_params
  #   params.require(:buyer_stock).permit(:quantity)
  # end
end

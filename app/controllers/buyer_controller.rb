class BuyerController < ApplicationController
  before_action :authenticate_buyer!

  def index
    @all_stocks = Stock.all
  end

  def portfolio
    @bought_stocks = current_buyer.stocks
  end

  def transactions
    @transactions = Transaction.where(buyer_id: current_buyer.id)
  end
end

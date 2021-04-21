class BrokerController < ApplicationController
  before_action :authenticate_broker!

  def index
    @stocks_list = Stock.stock_list
  end

  def portfolio
    @added_stocks = current_broker.stocks
  end
end

class AddStockPriceToBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_stocks, :stock_price, :float
  end
end

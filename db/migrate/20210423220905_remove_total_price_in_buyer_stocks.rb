class RemoveTotalPriceInBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :buyer_stocks, :total_price
  end
end

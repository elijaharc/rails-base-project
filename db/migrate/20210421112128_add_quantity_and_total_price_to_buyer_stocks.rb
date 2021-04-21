class AddQuantityAndTotalPriceToBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_stocks, :quantity, :integer
    add_column :buyer_stocks, :total_price, :float
  end
end

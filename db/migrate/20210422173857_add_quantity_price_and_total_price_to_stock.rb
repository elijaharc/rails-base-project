class AddQuantityPriceAndTotalPriceToStock < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :quantity, :integer
    add_column :stocks, :stock_price, :float
  end
end

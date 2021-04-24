class AddBrokerIdToBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :buyer_stocks, :broker_id, :integer
  end
end

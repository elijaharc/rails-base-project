class AddBrokerIdInStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :broker_id, :integer
  end
end

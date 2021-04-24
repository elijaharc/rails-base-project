class AddBrokerNameToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :broker_name, :string
  end
end

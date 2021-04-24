class AddBrokerNameToBrokers < ActiveRecord::Migration[6.1]
  def change
    add_column :brokers, :broker_name, :string
  end
end

class AddReferencesToBroker < ActiveRecord::Migration[6.1]
  def change
    add_reference :brokers, :admin, foreign_key: true
  end
end
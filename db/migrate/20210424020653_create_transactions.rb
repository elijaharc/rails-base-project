class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :broker, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: true
      t.string :ticker
      t.string :company_name
      t.string :stock_price
      t.string :quantity
      t.timestamps
    end
  end
end

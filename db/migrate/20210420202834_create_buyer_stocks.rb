class CreateBuyerStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :buyer_stocks do |t|
      t.references :buyer, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end

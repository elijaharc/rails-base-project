class AddBuyerEmailToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :buyer_email, :string
  end
end

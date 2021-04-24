class RemoveAddedByInStocks < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :added_by
  end
end

class ChangeBrokerIdBackToAddedBy < ActiveRecord::Migration[6.1]
  def change
    remove_column :stocks, :broker_id
    add_column :stocks, :added_by, :integer
  end
end

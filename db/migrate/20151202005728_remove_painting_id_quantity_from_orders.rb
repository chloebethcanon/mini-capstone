class RemovePaintingIdQuantityFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :painting_id, :integer
    remove_column :orders, :quantity, :integer
  end
end

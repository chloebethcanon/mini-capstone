class AddInStockToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :stock, :boolean, :default => true
  end
end

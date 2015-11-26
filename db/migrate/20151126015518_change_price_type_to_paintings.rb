class ChangePriceTypeToPaintings < ActiveRecord::Migration
  def change
    change_column :paintings, :price, :decimal, precision: 6, scale: 2
  end
end

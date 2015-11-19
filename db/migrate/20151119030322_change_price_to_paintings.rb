class ChangePriceToPaintings < ActiveRecord::Migration
  def change
    change_table :paintings do |t|
      t.change :price, :integer
    end
  end
end

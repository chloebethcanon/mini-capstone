class ChangeToCartedProducts < ActiveRecord::Migration
  def change
    change_table :carted_products do |t|
      t.rename :product_id, :painting_id
    end
  end
end

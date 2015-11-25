class ChangeToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.rename :product_id, :painting_id
    end
  end
end

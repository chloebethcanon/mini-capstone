class AddSupplierIdToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :supplier_id, :integer
  end
end

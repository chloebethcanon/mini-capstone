class ChangeToSuppliers < ActiveRecord::Migration
  def change
    change_table :suppliers do |t|
      t.remove :supplier_id
    end
  end
end

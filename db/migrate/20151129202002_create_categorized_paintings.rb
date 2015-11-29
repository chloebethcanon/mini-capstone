class CreateCategorizedPaintings < ActiveRecord::Migration
  def change
    create_table :categorized_paintings do |t|
      t.integer :category_id
      t.integer :painting_id

      t.timestamps null: false
    end
  end
end

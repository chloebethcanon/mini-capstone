class RemoveImageToPaintings < ActiveRecord::Migration
  def change
    change_table :paintings do |t|
      t.remove :image
    end
  end
end

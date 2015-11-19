class ChangeDescriptionToPaintings < ActiveRecord::Migration
  def change
    change_table :paintings do |t|
      t.change :description, :text
    end
  end
end

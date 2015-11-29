class CategorizedPainting < ActiveRecord::Base
  belongs_to :category
  belongs_to :painting
end

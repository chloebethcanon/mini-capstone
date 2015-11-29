class Category < ActiveRecord::Base
  has_many :categorized_paintings
  has_many :paintings, through: :categorized_paintings
end

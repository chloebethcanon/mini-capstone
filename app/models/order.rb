class Order < ActiveRecord::Base
  belongs_to :painting
  belongs_to :user


end

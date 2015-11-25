class Order < ActiveRecord::Base
  has_many :paintings
  belongs_to :user
end

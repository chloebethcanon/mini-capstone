class Supplier < ActiveRecord::Base
  has_many :paintings
end


# has_many creates a method that does the following:

# def paintings
#   make a join in the database
#   get all products associated with this supplier
#   return them in an array object
# end
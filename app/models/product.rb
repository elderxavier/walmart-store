class Product < ActiveRecord::Base
   attr_accessible :name, :description, :category_id, :category, :price
   belongs_to :category
   
   def category_name
     category.name if category
   end
end

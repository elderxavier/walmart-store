class Product < ActiveRecord::Base
   attr_accessible :name, :description, :category, :image_url, :price
end

class Product
   #attr_accessible :name, :description, :category_id, :category, :price
   include Mongoid::Document
   include Mongoid::Timestamps
   belongs_to :category, :dependent => :delete
   field :name, :type => String
   field :description, :type => String
   field :price, :type => BigDecimal
   field :atributos, :type => Hash
   def category_name
     category.name if category
   end
end

class Product
   #attr_accessible :name, :description, :category :attributes, :price
   include Mongoid::Document
   include Mongoid::Timestamps
   belongs_to :category
   field :name, :type => String
   field :description, :type => String
   field :price, :type => BigDecimal
   field :custom_attributes, :type => Hash
   
   validates_presence_of :name

   #campos passiveis de indexacao
   SORTING_FIELDS = ['name', 'updated_at']
   
   #invalido todos os caches apos um save ou delete
   after_save -> { Product.clear_cache }
   after_destroy -> { Product.clear_cache }

   def category_name
     category.name if category
   end

   #compondo dinamicamente os finders cacheaveis, de acordo com os campos possiveis
   SORTING_FIELDS.each do |field|
     singleton_class.instance_eval do
       define_method "all_cached_asc_#{field}" do
         all_cached_asc(field)
       end
     end
   end

   def self.clear_cache
     SORTING_FIELDS.each { |k| Rails.cache.delete("product_catalogue_#{k}")}
   end

   protected
   #metodo protegido de busca cacheada
   def self.all_cached_asc(key)
     Rails.cache.fetch("product_catalogue_#{key}") {Product.asc(key).entries}
   end
end

class Category
  #attr_accessible :name, :category, :category_id
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, :type => String
  has_many :products, :dependent => :restrict
  belongs_to :parent_category, :class_name => 'Category'
  has_many :child_categories, :foreign_key => 'parent_category_id', :class_name => 'Category', :order => :name.asc
  scope :root, where(:parent_category => nil)
  scope :asc_name, asc(:name)
  
  #garante que o cache de produtos sera limpo apos atualizacao das categorias
  after_save :nested_touch
  
  def nested_touch
    products.each(&:touch)
  end
  
  def self.full_tree_as_hash
    build_tree_map(Category.root.asc_name)
  end
  
  #algoritmo recursivo montando arvore
  def self.build_tree_map(query)
    query.inject([]) do |array, category| 
      array << category.attributes.to_hash.merge({:child_categories => Category.build_tree_map(category.child_categories)})
    end
  end

end

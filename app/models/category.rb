class Category
  #attr_accessible :name, :category, :category_id
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  has_many :products
  belongs_to :category, :dependent => :restrict
end

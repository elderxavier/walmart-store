# encoding: utf-8

FactoryGirl.define do
  factory :category_parent, :class => Category do
    name 'Vestuário'
  end
  factory :category, :class => Category do
    name 'Camisetas'
    association :parent_category, :factory => :category_parent
  end
end

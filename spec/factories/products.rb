# encoding: utf-8

FactoryGirl.define do
  map = {:cores => 'preta', :tamanhos => 'P,M,G'}
  factory :product do
    name 'Camiseta Iron Maiden'
    description 'Camiseta com várias versões do mascote da banda'
    price 75.0
    custom_attributes map
    association :category
  end
end

require 'spec_helper'

describe Product do
  it 'should validates presence of name' do
    product = FactoryGirl.build(:product, :name => nil)
    product.save.should be_false
    product.errors.get(:name).should_not be_nil
  end
  
  context 'cache' do
    it 'should include cached methods' do
      cached_methdos = [:all_cached_asc]
      Product::SORTING_FIELDS.each{|field| cached_methdos << "all_cached_asc_#{field}".to_sym }
      product_methods = Product.methods.grep(/cached/)
      cached_methdos.all?{|x| product_methods.include?(x)}.should be_true
    end

    it 'should clear cache after save' do
      product = FactoryGirl.build(:product)
      Product.should_receive(:clear_cache).and_return()
      product.save!
    end

    it 'should clear cache after destruction' do
      product = FactoryGirl.create(:product)
      Product.should_receive(:clear_cache).and_return()
      product.destroy
    end
  
    it 'should cache by the right key' do
      Product::SORTING_FIELDS.each do |field|
        Rails.cache.should_receive('fetch').with("product_catalogue_#{field}")
        Product.send("all_cached_asc_#{field}")
      end
    end
  end

end

require 'spec_helper'

describe Product do
  it 'should validates presence of name' do
    product = FactoryGirl.build(:product, :name => nil)
    product.save.should be_false
    puts product.errors.get(:name).should_not be_nil
  end
end

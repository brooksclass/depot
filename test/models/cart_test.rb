require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
	@product1 = products(:best)
	@product2 = products(:worst)
	@cart = carts(:one)
  end

 # test "should have these db counts to start" do
 # 	assert Cart.count == 2
 # 	assert Product.count == 5
 # 	assert LineItem.count == 2
 # end

  test "should add two different products" do
  	assert_difference 'LineItem.count', 2 do
  		@cart.add_product(@product1.id).save
  		@cart.add_product(@product2.id).save
  	end
  end

  test "should add same product" do
  	assert_difference 'LineItem.count', 1 do
      @cart.add_product(@product1.id).save
      @cart.add_product(@product1.id).save
  	end
  end

end 

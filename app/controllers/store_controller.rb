class StoreController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def index
  	@products = Product.order(:title)

 	if session[:count].nil?
 		session[:count] = 1
 	else
 		session[:count] += 1
 	end

  end

  def diagnostics
  	
  end

end 
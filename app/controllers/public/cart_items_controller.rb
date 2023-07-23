class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
     if cart_item.item_id == @cart_item.item_id
       new_quantity = cart_item.quantity + @cart_item.quantity
       cart_item.update_attribute(:quantity, new_quantity)
     else
      @cart_item.save
     end 
    end
    redirect_back(fallback_location: root_path)
  end
  
  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def update
　　@cart_item = current_customer.cart_items.find(params[:id])
　　@cart_item.update(cart_item_params)
　　redirect_back(fallback_location: root_path)
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_back(fallback_location: root_path)
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :quantity)
  end  

  
end

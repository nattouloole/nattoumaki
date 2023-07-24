class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def comfirm
    @order = Order.new(params)
    if params[:order][:select_address] == "0"
      @order.post_code = current_end_user.post_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
      
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.post_code = @address.post_code
       @order.address = @address.address
       @order.name = @address.name
       
    elsif params[:order][:select_address] == "2"
      @order.end_user_id = current_end_user.id
    end
      @cart_items = current_end_user.cart_items
      @order_new = Order.new
      render :confirm
  end

  def complete
    
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
    @customer = current_customer
    @order = Order.all
    @order_items = @order.order_items
    @total = 0
    @totals = @order_items.inject(0) { |sum, order_items| sum + order_items.subtotal }
    @shipping_fee = 800
  end
<<<<<<< HEAD

=======
  
  private
  
  def order_params
    params.require(:order).permit(:total_payment, :shipping_fee, :status, :name, :address, :post_code, :payment_method)
  end
>>>>>>> origin/develop
end
class Public::OrdersController < ApplicationController

def new
@order = Order.new
@addresses = Address.all
end

  def comfirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @order = Order.new(order_params)
    if params[:order][:address] == "0"
      @order.post_code = post_code
      @order.address = address
      @order.name = first_name + last_name

    elsif params[:order][:address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:address] == "2"
      @order.post_code = params[:order][:post_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      @cart_items = CartItem.all
      render :comfirm
    end

    @cart_items = CartItem.all
    @order_new = Order.new
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @shipping_fee = 800
  end

  private

  def order_params
    params.require(:order).permit(:total_payment, :shipping_fee, :status, :name, :address, :post_code, :payment_method)
  end
end
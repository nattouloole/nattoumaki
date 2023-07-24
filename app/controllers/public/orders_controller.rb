class Public::OrdersController < ApplicationController

def new
@order = Order.new
@addresses = Address.all
end

  def comfirm
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
      #render :comfirm
    end
    
    @cart_items = CartItem.all
    @order_new = Order.new
  end

  def complete

  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:total_payment, :shipping_fee, :status, :name, :address, :post_code, :payment_method)
  end
end
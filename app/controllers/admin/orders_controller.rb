class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end
  
  def show
    @customer = current_customer
    @order_items = @customer.order_items.all
    @total = 0
    @totals = @order_items.inject(0) { |sum, order_items| sum + order_items.subtotal }
    @shipping_fee = 800
    
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :shipping_fee, :status, :name, :address, :post_code, :payment_method)
  end
  
end

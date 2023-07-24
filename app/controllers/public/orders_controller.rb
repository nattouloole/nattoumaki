class Public::OrdersController < ApplicationController

  def new
  end

  def comfirm
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

end
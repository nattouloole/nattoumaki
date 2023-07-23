class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @addresses = Address.all
  end
  
  def comfirm
    @order = Order.new
    
  end
  
  def complete
    
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
end
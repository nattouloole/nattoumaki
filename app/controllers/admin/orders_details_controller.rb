class Admin::OrdersDetailsController < ApplicationController
  def update
    @customer = current_customer
    @order_items = Order_items.all
    @order_items.update(order_details_params)
    redirect_back(fallback_location: root_path)
  end
  
  private

  def order_details_params
    params.require(:order_items).permit(:order_id, :item_id, :quantity, :price, :making_status)
  end
  
end


class Admin::OrdersDetailsController < ApplicationController
  def update
    @order_details = Order_items.all
    @order_details.update(order_details_params)
    redirect_back(fallback_location: root_path)
  end
  
  private

  def order_details_params
    params.require(:order_items).permit(:order_id, :item_id, :quantity, :price, :making_status)
  end
  
end


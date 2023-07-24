class Admin::OrdersDetailsController < ApplicationController
  
  def update
    @customer = current_customer
    @order = Order.find(params[:order_id])
    @order_item = OrderItem.find(params[:id])
    @order_items = @order.order_items.all
    
    is_updated = true
    if @order_item.update(order_detail_params)
      @order.update(status: 2) if @order_item.making_status == "in_production"
      @order_items.each do |order_item|
        if order_item.making_status != "production_complete"
          is_updated = false
        end
      end
      @order.update(status: 3) if is_updated
    end
    redirect_back(fallback_location: root_path)
  end
  
  private

  def order_details_params
    params.require(:order_items).permit(:order_id, :item_id, :quantity, :price, :making_status)
  end
  
end


class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
  end

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :shipping_fee, :status, :name, :address, :post_code, :payment_method)
  end

end


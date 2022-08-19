class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    order_detail.making_status = params[:order_detail][:making_status]

    @order.update(order_params)
    order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order.id)
    
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, 
         :payment_method, :status, :address_id, :full_address)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
end

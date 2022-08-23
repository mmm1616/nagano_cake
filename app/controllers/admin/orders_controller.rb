class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    if @order.update(status: params[:order][:status])
      @order_details.update_all(making_status: 1)  if @order.status == "checking"
      redirect_to admin_order_path(@order.id)
    end
    
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, 
         :payment_method, :status, :address_id, :full_address)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
end

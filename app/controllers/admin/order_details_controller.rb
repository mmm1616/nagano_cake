class Admin::OrderDetailsController < ApplicationController
  def update
      @order_detail = OrderDetail.find(params[:id])
      @order = Order.find(params[:id])

      @order_detail.update(making_status: params[:order_detail][:making_status])
      redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
end

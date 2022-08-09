class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order_detail.find(params[:id])
    
    if  @order_detail.update(order_detail_params)
         redirect_to admin_order_path(@order.id)
         flash[:notice] = "商品が更新されました。"
    end
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
end

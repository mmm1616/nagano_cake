class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

  def update
      @order_detail =  OrderDetail.find(params[:id])
      @order = @order_detail.order
      @order_details = @order.order_details
      
       @is_make = true
      # @order_details.each do |order_detail|
      #   if order_detail.making_status != "waiting" or order_detail.making_status != "impossible"
      #     @is_make = false
      #   end
      # end
      
      @order_detail.update(making_status: params[:order_detail][:making_status])
      if @order_detail.making_status == "making"
        @order.update(status: "making")
      end
      
      count = 0
      @order_details.each do |order_detail|
        if order_detail.making_status == "finish"
          count += 1
        end
      end
      
       if count == @order_details.count
         @order.update(status: "preparing")
       end
      redirect_to admin_order_path(@order.id)
  end
      
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
  
   def order_params
    params.require(:order).permit(:status)
   end
end

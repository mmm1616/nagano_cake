class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @order_details = Order_detail.all
  end

  def update
    @order = Item.find(params[:id])
    
    if  @item.update(item_params)
        redirect_to admin_item_path(@item.id)
        flash[:notice] = "商品が更新されました。"
    else
        render :edit
    end
  end
end

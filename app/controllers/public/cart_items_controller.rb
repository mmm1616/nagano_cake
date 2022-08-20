class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    
    if  @cart_item.update(cart_item_params)
        redirect_to public_cart_items_path
    end
  end

  def destroy
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }  
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    @cart_items =current_customer.cart_items
    
    if @cart_item
       @cart_item.amount += CartItem.new(cart_item_params).amount
       @cart_item.save
       redirect_to public_cart_items_path
    else
       @cart_item = CartItem.new(cart_item_params)
       @cart_item.save
       redirect_to public_cart_items_path
    end
    
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  
  def item_params
    params.require(:item).permit(:image)
  end
  
end

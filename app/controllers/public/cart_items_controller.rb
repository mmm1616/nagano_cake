class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    
    if  @cart_item.update(cart_item_params)
        redirect_to public_cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart_items = CartItem.all
    render 'index'
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    render 'index'
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  
  def item_params
    params.require(:item).permit(:image)
  end
end

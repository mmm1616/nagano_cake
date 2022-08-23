class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    
    if  @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
  end

  def destroy
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }  
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_items =current_customer.cart_items #現在のユーザーのカート情報
    @cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id]) #今カートに入れようとしている商品があれば取得
    @new_cart_item = CartItem.new(cart_item_params)
     
    # count = 0
    # @cart_items.each do |cart_item|
    #   if cart_item.item_id == @new_cart_item.item_id
    #     count += 1
    #   end
    # end
    
      if @cart_item.present? #@cart_itemに値が入っているかいないか
        @cart_item.amount += @new_cart_item.amount
        @cart_item.save
        redirect_to cart_items_path
      else
         @new_cart_item.save
         redirect_to cart_items_path
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

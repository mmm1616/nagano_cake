class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :move_to_order, only: [:new, :confirm]

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @address_id = params[:order][:address_id]

    if params[:order][:full_address] == "0"
       @order = Order.new
       @order.postal_code = current_customer.postal_code
       @order.address = current_customer.address
       @order.name = current_customer.last_name + current_customer.first_name
       @order.payment_method = params[:order][:payment_method]
    elsif params[:order][:full_address] == "1"
       @order = Order.new
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
       @order.payment_method = params[:order][:payment_method]
    else  
       @order = Order.new
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
       @order.payment_method = params[:order][:payment_method]
    end

  end

  def complete
  end

  def create
   
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    
      @order.save
      current_customer.cart_items.each do |cart_item|
       order_detail = OrderDetail.new
       order_detail.item_id = cart_item.item.id
       order_detail.order_id = @order.id
       order_detail.amount = cart_item.amount
       order_detail.price = cart_item.item.add_tax_price
       order_detail.save
      end
      redirect_to orders_complete_path
      current_customer.cart_items.destroy_all
    
  end
  

  def index
    @orders = current_customer.orders
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, 
         :payment_method, :status, :address_id, :full_address)
  end
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :price, :making_status)
  end
  
  def move_to_order
    @cart_items = current_customer.cart_items
    
    unless @cart_items.exists?
      flash[:notice]="カートに商品を入れてください。"
      redirect_to cart_items_path
    end
  end

end

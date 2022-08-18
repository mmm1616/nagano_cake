class Public::OrdersController < ApplicationController
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
       @order.name = current_customer.first_name + current_customer.last_name
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
      current_customer.cart_item.destroy_all
  end

  def create
    @order = Order.new
    @order.save
    render :complete
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, 
         :payment_method, :status, :address_id, :full_address)
  end

end

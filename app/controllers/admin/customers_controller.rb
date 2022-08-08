class Admin::CustomersController < ApplicationController
  def new
   @customer = Customer.new
  end
  
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to public_customers_path(@customer.id)
  end

  def update
        @customer = Customer.find(params[:id])
    
    if  @customer.update(customer_params)
        redirect_to admin_customer_path(@customer.id)
        flash[:notice] = "会員情報が更新されました。"
    else
        render :edit
    end
  end
  
  private
  
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, 
                               :postal_code, :address, :telephone_number, :is_active)
   end
   
end

class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @items = Item.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    
    if  @customer.update(customer_params)
        redirect_to public_customer_path(@customer.id)
        flash[:notice] = "会員情報が更新されました。"
    else
        render :edit
    end
    
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
  end
  
  def destroy
    @customer = Customer.find(params[:id]) 
    @customer.destroy
    redirect_to public_homes_top_path
  end
  
  private
  
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, 
                               :postal_code, :address, :telephone_number, :email)
   end
  
 
end

class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @items = Item.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    
    if  @customer.update(customer_params)
        redirect_to public_customers_mypage_path
        flash[:notice] = "会員情報が更新されました。"
    else
        render :edit
    end
    
  end

  def unsubscribe
    @customer = current_customer.id
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

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
        redirect_to customers_mypage_path
        flash[:notice] = "会員情報が更新されました。"
    else
        render :edit
    end
    
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
    flash[:notice]="ご利用いただき、ありがとうございました。"
  end
  
  private
  
   def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, 
                               :postal_code, :address, :telephone_number, :email, :is_deleted)
   end
  
 
end

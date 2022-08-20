class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all

    if params[:genre_id] == nil
    @items = Item.page(params[:page]).per(10)
    else
    items = Item.where(genre_id: params[:genre_id])
    @items = items.page(params[:page]).per(10)
    @genre = Genre.find(params[:genre_id])
    end

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @customer = current_customer
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      @cart_item.amount += params[:amount].to_i
    else
      flash[:notice]="個数を選択してください。"
      render 'show'
    end
  end
  
  private
    def item_params
    params.require(:item).permit(:image)
    end
    
    def genre_params
    params.require(:genre).permit(:genre_id, :name)
    end
    
    def cart_item_params
      params.require(:cart_item).permit(:amount, :customer_id)
    end
    
   
end

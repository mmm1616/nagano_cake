class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def index
    @items = Item.all
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
    @genre = Genre.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.find(params[:id])
  end

  def update
     @item = Item.find(params[:id])
    
    if  @item.update(item_params)
        redirect_to admin_item_path(item.id)
        flash[:notice] = "ジャンルが更新されました。"
    else
        render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
  
end

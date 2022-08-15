class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.find(params[:genre_id])

    if params[:genre_id] == nil
    @items = Item.page(params[:page]).per(10)
    else
    items = Item.where(genre_id: params[:genre_id])
    @items = items.page(params[:page]).per(10)
    end

  end

  def show
    @item = Item.find(params[:id])
  end
  
  private
    def item_params
    params.require(:item).permit(:image)
    end
    
    def genre_params
    params.require(:genre).permit(:genre_id, :name)
    end
end

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.unscoped.find(params[:id])
  end
end

private

def item_params
  params.require(:item).permit(:title,
                               :description,
                               :price,
                               :categories,
                               :image)
end

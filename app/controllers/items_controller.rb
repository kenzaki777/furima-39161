class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all.order("id DESC")
  end
  def new
   @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

  def item_params
    params.require(:item).permit(:item_name, :concept,:item_type_id,:item_condition_id,:price,:sender_area_id,:days_ship_id,:cost_type_id, :image).merge(user_id: current_user.id)
  end
  

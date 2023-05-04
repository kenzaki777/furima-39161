class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit,:destroy]
  before_action :road_item,only:[:show,:edit,:update,:destroy]
  before_action :judgment_user,only:[:edit,:update,:destroy]
  before_action :judgment_user_sold_out,only:[:edit]
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

  def show
    
  end

  def edit
    
    end
  

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end



private

  def item_params
    params.require(:item).permit(:item_name, :concept,:item_type_id,:item_condition_id,:price,:sender_area_id,:days_ship_id,:cost_type_id, :image).merge(user_id: current_user.id)
  end
  
  

  def road_item
    @item = Item.find(params[:id])
  end

  def judgment_user
    redirect_to root_path unless current_user == @item.user
  end
  def judgment_user_sold_out
    @item = Item.find(params[:id])
    if @item.record.present?
      redirect_to action: :index
    end
  end
end


class ItemsController < ApplicationController
  def index
  end




  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name,:description,:category_id,:product_condition_id,:delivery_fee_id,:prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end


end
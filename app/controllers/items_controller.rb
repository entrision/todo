class ItemsController < ApplicationController
  def index
    @items = Item.all
    flash.now[:success] = 'You have thirty minutes to move your car.'
    flash.now[:warning] = 'Your car has been impounded,'
    flash.now[:danger] = 'Your car has been crushed into a cube.'
    flash.now[:info] = 'You have thirty minutes to move your cube.'
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.body = params[:item][:body]
    @item.save!
    redirect_to items_path
  end

  def finish
    @item = Item.find params[:id]
    @item.done = true
    @item.save!
    redirect_to items_path
  end
end

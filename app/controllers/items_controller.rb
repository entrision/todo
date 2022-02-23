class ItemsController < ApplicationController
  def index
    @items = Item.all
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

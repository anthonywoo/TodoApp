class ItemsController < ApplicationController

  def index
    @items = Item.where(:project_id => params[:project_id])
    @item = Item.new
    @item.project_id = params[:project_id]
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create!(params[:item])
    redirect_to project_items_url(@item.project)
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attributes(:completed => true)
    #render :show
    redirect_to item_url(@item)
  end

  def incomplete
    @item = Item.find(params[:id])
    @item.update_attributes(:completed => false)
    #render :show
    redirect_to item_url(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to project_url(@item.project)
  end
end

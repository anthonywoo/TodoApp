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

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    render :show
  end

  def create
    @item = Item.create!(params[:item])
    redirect_to project_items_url(@item.project)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to project_url(@item.project)
  end

  def search
    query = params[:query]
    query = Item.search(query)
    @items = query
  end

  def update_batch
    items = params[:item]
    items.each do |k,query|
      item = Item.find(k.to_i)
      item.update_attributes(query)
    end
    project = Item.find(items.keys[0]).project
    redirect_to project_url(project)
  end
end

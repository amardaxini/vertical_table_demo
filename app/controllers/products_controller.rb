class ProductsController < ApplicationController
  def index
    if params[:search].blank?
      @products = Product.all
    else
      @products = Product.name_like(params[:search]) 
    end
  end
  
  def show
    @product = Product.find(params[:id])
    @items = @product.items
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end
  def search_product_items
    
  end
  def search_items
    #f@items = Item.find_all_by_name_or_by_
  end
end

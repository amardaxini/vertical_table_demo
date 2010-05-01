class ItemsController < ApplicationController
  before_filter :load_product
  def index
    @items = @product.items
  end
  
  def show
    @item = @product.items.find(params[:id])
  end
  
  def new
    @item = @product.items.new
    @product.product_attributes.each do |product_attribute|
      @item.item_attributes.build(:name=>product_attribute.name,
                      :product_attribute_id=>product_attribute.id)
    end
  end
  
  def create
    @item = @product.items.new(params[:item])
    if @item.save
      @item.create_update_item_attributes(params[:item][:item_attributes])
      flash[:notice] = "Successfully created item."
      redirect_to product_item_path(@product,@item)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @item = @product.items.find(params[:id])
     @product.product_attributes.each do |product_attribute|
       unless @item.item_attributes.collect(& :name).include?(product_attribute.name)
         @item.item_attributes.build(:name=>product_attribute.name,
                        :product_attribute_id=>product_attribute.id)
       end
    end
  end
  
  def update
    @item = @product.items.find(params[:id])
    if @item.update_attributes(params[:item])
       @item.create_update_item_attributes(params[:item][:item_attributes])
      flash[:notice] = "Successfully updated item."
      redirect_to product_item_path(@product,@item)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @item = @product.items.find(params[:id])
    @item.destroy
    flash[:notice] = "Successfully destroyed item."
    redirect_to product_items_url(@product)
  end
  private
  def load_product
    @product = Product.find(params[:product_id])
  end
end

class ProductAttributesController < ApplicationController
 before_filter :load_product
  def index
    @product_attributes = @product.product_attributes
  end
  
  def show
    @product_attribute = @product.product_attributes.find(params[:id])
  end
  
  def new
    @product_attribute = @product.product_attributes.new
  end
  
  def create
    @product_attribute = @product.product_attributes.new(params[:product_attribute])
    if @product_attribute.save
      flash[:notice] = "Successfully created product attribute."
      redirect_to product_product_attributes_path(@product)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product_attribute = @product.product_attributes.find(params[:id])
  end
  
  def update
    @product_attribute = @product.product_attributes.find(params[:id])
    if @product_attribute.update_attributes(params[:product_attribute])
      flash[:notice] = "Successfully updated product attribute."
      redirect_to @product_attribute
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product_attribute = @product.product_attributes.find(params[:id])
    @product_attribute.destroy
    flash[:notice] = "Successfully destroyed product attribute."
    redirect_to product_product_attributes_url(@product)
  end
  private
  def load_product
    @product = Product.find(params[:product_id]) 
  end
end

require 'test_helper'

class ProductAttributesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => ProductAttribute.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    ProductAttribute.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    ProductAttribute.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to product_attribute_url(assigns(:product_attribute))
  end
  
  def test_edit
    get :edit, :id => ProductAttribute.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    ProductAttribute.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductAttribute.first
    assert_template 'edit'
  end
  
  def test_update_valid
    ProductAttribute.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductAttribute.first
    assert_redirected_to product_attribute_url(assigns(:product_attribute))
  end
  
  def test_destroy
    product_attribute = ProductAttribute.first
    delete :destroy, :id => product_attribute
    assert_redirected_to product_attributes_url
    assert !ProductAttribute.exists?(product_attribute.id)
  end
end

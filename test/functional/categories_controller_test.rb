require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def test_create_invalid
    Category.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Category.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to categories_url
  end
  
  def test_destroy
    category = Category.first
    delete :destroy, :id => category
    assert_redirected_to categories_url
    assert !Category.exists?(category.id)
  end
end

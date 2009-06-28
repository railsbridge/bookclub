require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Review.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Review.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Review.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to review_url(assigns(:review))
  end
  
  def test_edit
    get :edit, :id => Review.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Review.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Review.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Review.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Review.first
    assert_redirected_to review_url(assigns(:review))
  end
  
  def test_destroy
    review = Review.first
    delete :destroy, :id => review
    assert_redirected_to reviews_url
    assert !Review.exists?(review.id)
  end
end

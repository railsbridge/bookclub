require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Genre.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Genre.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Genre.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to genre_url(assigns(:genre))
  end
  
  def test_edit
    get :edit, :id => Genre.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Genre.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Genre.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Genre.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Genre.first
    assert_redirected_to genre_url(assigns(:genre))
  end
  
  def test_destroy
    genre = Genre.first
    delete :destroy, :id => genre
    assert_redirected_to genres_url
    assert !Genre.exists?(genre.id)
  end
end

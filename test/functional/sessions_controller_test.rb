require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test 'should show login form' do
    get :new
    assert_response :success
    assert_template 'new'
    assert_select 'form p', 4
  end

  test 'should perform user login' do
    post :create, :login => 'nick', :password =>'ni123'
    assert_redirected_to books_path
    assert_equal users(:nick).id, session[:user_id]
    assert_equal users(:nick), assigns(:current_user)
  end

  test 'should fail user login' do
    post :create, :login => 'john', :password => 'ni123'
    assert_response :success
    assert_template 'new'
    assert_nil session[:user_id]
  end

  test 'should redirect after login with return url' do
    post :create, {:login => 'nick', :password => 'ni123'}, :return_to => '/books/new'
    assert_redirected_to '/books/new'
  end

  test 'should logout and clear session' do
    post :create, :login => 'nick', :password => 'ni123'
    assert_not_nil assigns(:current_user)
    assert_not_nil session[:user_id]

    delete :destroy
    assert_response :redirect
    assert_redirected_to '/books'
    assert_nil assigns(:current_user)
    assert_nil session[:user_id]
  end



end


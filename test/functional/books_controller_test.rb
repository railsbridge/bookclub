require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Book.first
    assert_template 'show'
  end

  def test_new
    get_with_user :new
    assert_template 'new'
  end

  def test_create_invalid
    Book.any_instance.stubs(:valid?).returns(false)
    post_with_user :create
    assert_template 'new'
  end

  def test_create_valid
    Book.any_instance.stubs(:valid?).returns(true)
    post_with_user :create
    assert_redirected_to book_url(assigns(:book))
  end

  def test_edit
    get_with_user :edit, :id => Book.first
    assert_template 'edit'
  end

  def test_update_invalid
    Book.any_instance.stubs(:valid?).returns(false)
    put_with_user :update, :id => Book.first
    assert_template 'edit'
  end

  def test_update_valid
    Book.any_instance.stubs(:valid?).returns(true)
    put_with_user :update, :id => Book.first
    assert_redirected_to book_url(assigns(:book))
  end

  def test_destroy
    book = Book.first
    delete_with_user :destroy, :id => book
    assert_redirected_to books_url
    assert !Book.exists?(book.id)
  end

  test 'should show book submitter' do
    get :show, :id => books(:one)
    assert_select 'p.added_by span', 'nick'
  end

  test 'should indicate not logged in' do
    get :index
    assert_select 'div.login_logout em', 'Not logged in.'
  end

  test 'should show menu' do
    get :index
    assert_select 'div.menu-bar a', 'Main'
  end

  test 'should indicate logged in user' do
    get_with_user :index
    assert_equal users(:nick), assigns(:current_user)
    assert_select 'div.login_logout em a', '(Logout)'
  end

  test 'should redirect if not logged in' do
   get :new
   assert_response :redirect
   assert_redirected_to new_session_path
  end

  test 'should store user with book' do
    post_with_user :create, :book => {
        :title => 'How to read',
        :published_year => '1981',
        :isbn => '123456788',
        :description => 'Great book about books'
    }
    assert_equal users(:nick), assigns(:book).user
  end
end


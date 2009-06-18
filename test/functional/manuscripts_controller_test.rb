require 'test_helper'

class ManuscriptsControllerTest < ActionController::TestCase
  def test_create_invalid
    Manuscript.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Manuscript.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to manuscripts_url
  end
  
  def test_destroy
    manuscript = Manuscript.first
    delete :destroy, :id => manuscript
    assert_redirected_to manuscripts_url
    assert !Manuscript.exists?(manuscript.id)
  end
end

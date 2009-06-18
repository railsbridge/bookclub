require 'test_helper'

class ReadingsControllerTest < ActionController::TestCase
  def test_create_invalid
    Reading.any_instance.stubs(:valid?).returns(false)
    post_with_user :create
    assert_template 'new'
  end

  def test_create_valid
    Reading.any_instance.stubs(:valid?).returns(true)
    post_with_user :create
    assert_redirected_to readings_url
  end

  def test_destroy
    reading = Reading.first
    delete_with_user :destroy, :id => reading
    assert_redirected_to readings_url
    assert !Reading.exists?(reading.id)
  end
end


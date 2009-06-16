require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  def test_create_invalid
    Friendship.any_instance.stubs(:valid?).returns(false)
    post_with_user :create
    request.env["/books"]
    #assert_template 'new'
    assert_redirected_to
  end

  def test_create_valid
    Friendship.any_instance.stubs(:valid?).returns(true)
    post_with_user :create
    assert_redirected_to :back
  end

  def test_destroy
    friendship = Friendship.first
    delete_with_user :destroy, :id => friendship
    #assert_redirected_to friendships_url
    assert !Friendship.exists?(friendship.id)
  end
end


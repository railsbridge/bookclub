require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user should have a books association" do
    assert_equal 2, users(:nick).books.size
    assert_equal books(:one), users(:nick).books.first
  end
end


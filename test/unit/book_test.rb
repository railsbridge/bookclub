require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should be associated with user" do
    assert_equal users(:nick), books(:one).user
  end
end


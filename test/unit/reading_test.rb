require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Reading.new.valid?
  end
end

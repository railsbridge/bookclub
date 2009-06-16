require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Genre.new.valid?
  end
end

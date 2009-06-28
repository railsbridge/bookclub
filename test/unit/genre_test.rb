require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  def test_should_be_valid
    genre = Genre.new(:name => 'edu')
    assert genre.valid?
  end
end


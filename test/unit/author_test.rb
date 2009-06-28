require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def test_should_be_valid
    author = Author.new(:name => 'DD', :country => 'Boa')
    assert author.valid?
  end
end


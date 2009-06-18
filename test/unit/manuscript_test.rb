require 'test_helper'

class ManuscriptTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Manuscript.new.valid?
  end
end

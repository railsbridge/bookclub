require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def test_should_be_valid
    review = Review.new(:review => 'teste', :rating => 6)
    assert review.valid?
  end

  test 'unsuccesefully create a review' do
    assert_no_difference 'Review.count' do
        Review.create(:review => "Great book")
    end
  end
end


require 'test_helper'

class BookTest < ActiveSupport::TestCase
  should_require_attributes :title, :author
  should_require_unique_attributes :name

  should_have_one :profile
  should_have_many :dogs
  should_have_many :messes, :through => :dogs
  should_belong_to :lover
end

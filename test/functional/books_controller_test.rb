require 'test/unit'

class BooksControllerTest < Test::Unit::TestCase
  context "on GET to :new" do
    setup do
      get :new
    end

    should_assign_to :book
    should_respond_with :success
    should_render_template :show
  end
end

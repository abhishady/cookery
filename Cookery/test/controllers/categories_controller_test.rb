require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get catview" do
    get :catview
    assert_response :success
  end

end

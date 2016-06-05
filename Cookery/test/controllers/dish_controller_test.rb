require 'test_helper'

class DishControllerTest < ActionController::TestCase
  test "should get dishview" do
    get :dishview
    assert_response :success
  end

end

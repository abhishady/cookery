require 'test_helper'

class AddDishControllerTest < ActionController::TestCase
  test "should get adview" do
    get :adview
    assert_response :success
  end

end

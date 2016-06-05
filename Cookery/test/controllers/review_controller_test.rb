require 'test_helper'

class ReviewControllerTest < ActionController::TestCase
  test "should get rview" do
    get :rview
    assert_response :success
  end

end

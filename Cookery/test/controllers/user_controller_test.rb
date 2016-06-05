require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get uview" do
    get :uview
    assert_response :success
  end

end

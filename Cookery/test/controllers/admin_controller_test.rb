require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get admin_view" do
    get :admin_view
    assert_response :success
  end

end

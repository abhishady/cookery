require 'test_helper'

class UserdetailControllerTest < ActionController::TestCase
  test "should get udview" do
    get :udview
    assert_response :success
  end

end

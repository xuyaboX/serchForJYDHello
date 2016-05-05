require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get loginuser" do
    get :loginuser
    assert_response :success
  end

end

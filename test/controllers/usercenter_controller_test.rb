require 'test_helper'

class UsercenterControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

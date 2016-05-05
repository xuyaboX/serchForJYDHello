require 'test_helper'

class BookControllerTest < ActionController::TestCase
  test "should get gotoSelect" do
    get :gotoSelect
    assert_response :success
  end

end

require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get locations" do
    get :locations
    assert_response :success
  end

end

require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get routing_error" do
    get :routing_error
    assert_response :success
  end

end

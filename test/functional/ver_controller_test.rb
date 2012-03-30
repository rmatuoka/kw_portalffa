require 'test_helper'

class VerControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

require 'test_helper'

class YueyueControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

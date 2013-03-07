require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should login' do
    chengbin1 = users(:one)
    post :login, :name => chengbin1.name, :password => 'pass'
    assert_redirected_to home_index_path
  end
end

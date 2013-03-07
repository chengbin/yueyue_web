require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should login' do
    assert_equal session[:user_id], nil
    chengbin1 = users(:one)
    post :login, :name => chengbin1.name, :password => 'pass'
    assert_redirected_to home_index_path
    assert_equal session[:user_id], chengbin1.id
  end
  
  test 'should login failed' do
    assert_equal session[:user_id], nil
    chengbin1 = users(:one)
    post :login, :name => chengbin1.name, :password => 'no_pass'
    assert_equal session[:user_id], nil
  end
end

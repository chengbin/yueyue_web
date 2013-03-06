#encoding: UTF-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  def new_user(user_name)
    User.new(:name => user_name, :password => 'pass', :password_confirmation => 'pass')
  end
  
  test "成斌是世界上最帅的男人" do
    assert true
  end
  
  test 'User attribute must not be empty' do
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:password].any?
  end
  
  test 'name should be unique' do
    user = new_user(users(:one).name)
    assert !user.save
    assert_equal "邮箱已被注册", user.errors[:name].join('; ')
  end
  
  test 'name should be valid email' do
    ok = %w{ fox@huawei.com stone@163.net big_daddy@fox.cc }
    bad = %w{ fox@huawei stone.net big_daddy_fox.cc}
    
    ok.each do |name|
      assert new_user(name).valid?, "#{name} should be valid"
    end
    
    bad.each do |name|
      assert new_user(name).invalid?, "#{name} should be invalid"
    end
  end
  
  test 'password should be confirmed' do
    user = User.new(:name => 'chengbin@facebook.com', :password => 'pass', :password_confirmation => 'no_pass')
    assert user.invalid?
    assert_equal "密码不一致", user.errors[:password].join('; ')
  end
  
end

#encoding: UTF-8
class HomeController < ApplicationController
  def index
  end

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_url = session[:after_success_login] || home_index_path
        session[:after_success_login] = nil
        redirect_to(redirect_url)
      else
        flash[:notice] = "错误的用户名或者密码。"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_index_path
  end
end

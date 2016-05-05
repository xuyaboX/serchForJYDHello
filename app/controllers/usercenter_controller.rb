class UsercenterController < ApplicationController
  #对访问进来的链接进行session判断
  before_action :session_c, only: [:index]

  def index
  end

  def session_c
    if session[:usersession]==nil then
      respond_to do |format|
        format.html {redirect_to login_index_url }
      end
    end
  end
end

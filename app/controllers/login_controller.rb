class LoginController < ApplicationController
  #这是是一个页面跳转跳转到用户的登录页面
  def index
  end

  #用户登录使用
  def loginuser


    @usertable = Usertable.new(usertable_params)
    @selectusertable = Usertable.where(:name => @usertable.name)

    #在数据库中查询是否存在这个用户名
    if @selectusertable.size ==0
      respond_to do |format|
        format.html { redirect_to login_index_url, notice: '没有在数据库中找到您的用户名.' }
      end
      return
    end
    #判断用户输入的密码是不是和我们的密码相同
    unless @selectusertable[0].pwd.to_s==@usertable.pwd.to_s
      respond_to do |format|
        format.html { redirect_to login_index_url, notice: '对不起您输入的密码是错误的.' }
      end
      return
    end

    #保存session并且返回到用户中心页面
    session[:usersession] = @selectusertable[0].book
    respond_to do |format|

      format.html { redirect_to usercenter_index_url }
    end
  end

  def usertable_params
    params.require(:usertable).permit(:name, :pwd)
  end
end

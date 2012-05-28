class UserSessionsController < ApplicationController
#  before_filter :navegadorie6
#  layout "admin"
  layout "template2012" 
  before_filter :load_menu  
  def new
    create_template(4)
    @user_session = UserSession.new
    @user = User.new(:receber_info => true, :gender => false)
  end
 
  def create
    @admin = false
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      if (User.find(@user_session.user).has_role? :admin)
        @admin = true
      end
    else
      flash[:error] = "Usuário e/ou senha inválidos!"
    end
  end
 
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Sessão finalizada com sucesso."
    redirect_to root_url
  end
end

class Admin::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
      allow :supervisor, :to => [:index, :search]
      
  end  
  
  layout "inadmin"
  
  def index
    @users = User.all.paginate :page => params[:page],:per_page => 50
  end

  def show
    @user = User.find(params[:id])
  end
  
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user), :notice  => "Dados Atualizados com sucesso!"
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, :notice => "Usuário Deletado com sucesso!"
  end
  
  def search
    if !params[:keyword].blank?
      @Results = User.search_for(params[:keyword]).paginate :page => params[:page],:per_page => 50
    end
  end
    
end

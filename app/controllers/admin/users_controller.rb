class Admin::UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]  
  access_control do
      allow :admin, :all
      allow :supervisor, :to => [:index, :search]      
  end  
  #layout "inadmin"
  layout "admin_20141208"
    
  def index
    @users = User.all(:order => "id DESC").paginate :page => params[:page],:per_page => 100
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
      @Results = User.search_for(params[:keyword]).paginate :page => params[:page],:per_page => 100
    end
  end
  
  def export
    @users = User.all(:select => "name, email, receber_info", :order => "name")
    respond_to do |format|
      format.html { render :xml => @users }
      format.csv #{ render text: @users.send_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
      format.xml  { render :xml => @users }     
    end  
  end
    
end

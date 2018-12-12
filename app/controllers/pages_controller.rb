class PagesController < ApplicationController
authorize_resource :class => PagesController
  def dashboard
    @users = User.all
  end

  def asignadmin
    @user = User.find(params[:user_id])
    @user.admin!
    redirect_to pages_dashboard_path
  end

  def deladmin
    @user = User.find(params[:user_id])
    @user.visit!
    redirect_to pages_dashboard_path
  end

  def deluser
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to pages_dashboard_path
  end

end

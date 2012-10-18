class Admin::PermissionsController < ApplicationController
  before_filter :im_admin?

  def index
    @users = User
  end

  def show

  end

  def edit
    @user = User.find(params[:id])
    @permissions = Permission
  end

  def update
    user = User.find(params[:id])

  end

  private
  def im_admin?
    redirect_to user_session_path unless current_user && current_user.roles.exists?(Role.find_by_name('Admin'))
  end
end

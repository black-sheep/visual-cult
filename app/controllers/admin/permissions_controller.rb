class Admin::PermissionsController < ApplicationController
  before_filter :im_admin?

  def edit
    @role = Role.find(params[:id])
  end

  #def update
  #  @role = Role.find(params[:id])
  #  roles = params[:role]
  #  roles.each do |key, value|
  #    if value == "0" && @role.permissions.exists?(Permission.find(key))
  #      @role.permissions.delete(Permission.find(key))
  #    elsif value == "1" && ! @role.permissions.exists?(Permission.find(key))
  #      @role.permissions<<Permission.find(key)
  #    end
  #  end
  #
  #  if @role.save
  #    redirect_to admin_permissions_path
  #  else
  #    render :edit
  #  end
  #end

  def roles
    @users = User
  end

  private
  def im_admin?
    redirect_to user_session_path unless current_user && current_user.roles.exists?(Role.find_by_name('Admin'))
  end
end

class UsersController < ApplicationController
  def index
    @users = User
  end

  def new
    redirect_to new_user_registration_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to edit_user_registration_path
  end
end

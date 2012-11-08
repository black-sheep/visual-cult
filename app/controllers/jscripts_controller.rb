class JscriptsController < ApplicationController

  def vote
    @votes = Photo.find(params[:id])
    @votes.raiting += 1
    @votes.save

    respond_to do |format|
      format.json { render :json => @votes.raiting }
    end
  end

  def take_role
    @user = User.find(params[:user_id])
    @user.roles.delete(@user.roles)
    @user.roles << Role.find(params[:role_id])

    respond_to do |format|
      format.json { render :json => @user }
    end
  end
end

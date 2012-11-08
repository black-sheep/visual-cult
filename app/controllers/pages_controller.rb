class PagesController < ApplicationController
  before_filter :im_admin?, only: [ :admin ]

  def index
  end

  def admin

  end

  private
  def im_admin?
    redirect_to root_path unless current_user && current_user.roles.exists?(Role.find(1))
  end
end

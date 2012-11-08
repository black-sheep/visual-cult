class BlogsController < ApplicationController
  before_filter :load_user

  def index
    @blogs = @user.blogs.order('created_at DESC')
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = @user.blogs.new(params[:blog])
    if @blog.save
      redirect_to user_blogs_path(params[:user_id])
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
  def load_user
    @user = User.find(params[:user_id])
  end
end

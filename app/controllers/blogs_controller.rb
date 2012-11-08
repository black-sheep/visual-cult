class BlogsController < ApplicationController
  include ApplicationHelper

  before_filter :load_user
  before_filter :have_permissions?, only: [:new, :create, :edit, :update, :destroy]

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
    @blog = @user.blogs.find(params[:id])
  end

  def update
    blog = @user.blogs.find(params[:id])
    if blog.update_attributes(params[:blog])
      redirect_to user_blogs_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    blog = @user.blogs.find(params[:id])
    blog.destroy
    redirect_to user_blogs_path(@user.id)
  end

  private
  def load_user
    @user = User.find(params[:user_id])
  end

  def have_permissions?
    user = User.find(params[:user_id])
    redirect_to user_blogs_path(params[:user_id]) unless authenticate_user! && have_permissions_controller(user.id)
  end
end

# coding: utf-8

class GalleriesController < ApplicationController
  before_filter :load_gallery

  def index
    @galleries = @user.galleries
  end

  def show
    @gallery = @user.galleries.find(params[:id])
  end

  def new
    @gallery = @user.galleries.new
  end

  def create
    @gallery = @user.galleries.new(params[:gallery])
    if @gallery.save
      redirect_to user_gallery_path(@user, @gallery)
    else
      render :new
    end
  end

  def edit
    @gallery = @user.galleries.find(params[:id])
  end

  def update
    @gallery = @user.galleries.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to user_gallery_path(@user, @gallery)
    else
      render :edit
    end
  end

  def destroy
    @gallery = @user.galleries.find(params[:id])
    @gallery.destroy
    redirect_to user_galleries_path
  end

  private

  def load_gallery
    @user = User.find(params[:user_id])
  end
end

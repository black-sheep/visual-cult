class NewsController < ApplicationController
  include ApplicationHelper
  include NewsHelper

  before_filter :have_permissions?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @news = New.order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @new = New.new
  end

  def create
    @new = New.new(params[:new])
    if @new.save
      redirect_to news_index_path
    else
      render :new
    end
  end

  def edit
    @new = New.find(params[:id])
  end

  def update
    new = New.find(params[:id])
    if new.update_attributes(params[:new])
      redirect_to news_index_path
    else
      render :edit
    end
  end

  def destroy
    new = New.find(params[:id])
    new.destroy
    redirect_to news_index_path
  end

  private
  def have_permissions?
    redirect_to news_index_path unless authenticate_user! && have_permissions_news(current_user.id)
  end


end

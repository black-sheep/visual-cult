class NewsController < ApplicationController
  include ApplicationHelper

  before_filter :can_add_news, only: [:new, :create]
  before_filter :can_edit_news, only: [:edit, :update]
  before_filter :can_delete_news, only: [:destroy]

  def index
    @news = New.order('created_at DESC')
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

  # TODO: Завернуть 3 шляпных метода в одно прекрасное

  def can_add_news
    redirect_to news_index_path unless can?('create_news')
  end

  def can_edit_news
    redirect_to news_index_path unless can?('edit_news')
  end

  def can_delete_news
    redirect_to news_index_path unless can?('delete_news')
  end

end

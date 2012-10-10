class NewsController < ApplicationController
  def index
    @news = New.order('created_at DESC')
  end

  def show
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

  end

  def destroy

  end

end

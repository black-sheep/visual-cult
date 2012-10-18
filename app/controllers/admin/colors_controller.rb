class Admin::ColorsController < ApplicationController
  def index
    @colors = Color
  end

  def new
    @color = Color.new
  end

  def create
    color = Color.new(params[:color])
    if color.save
      redirect_to admin_colors_path
    else
      render :new
    end
  end

  def edit
    @color = Color.find(params[:id])
  end

  def update
    color = Color.find(params[:id])
    if color.update_attributes(params[:color])
      redirect_to admin_colors_path
    else
      render :edit
    end
  end

  def destroy
    color = Color.find(params[:id])
    color.destroy
    redirect_to admin_colors_path
  end
end

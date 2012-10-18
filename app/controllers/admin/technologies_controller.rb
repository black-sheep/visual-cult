class Admin::TechnologiesController < ApplicationController
  def index
    @technologies = Technology
  end

  def new
    @technology = Technology.new
  end

  def create
    technology = Technology.new(params[:technology])
    if technology.save
      redirect_to admin_technologies_path
    else
      render :new
    end
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def update
    technology = Technology.find(params[:id])
    if technology.update_attributes(params[:technology])
      redirect_to admin_technologies_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    technology = Technology.find(params[:id])
    technology.destroy
    redirect_to admin_technologies_path
  end
end

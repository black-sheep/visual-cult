class Admin::RubriksController < ApplicationController
  def index
    @rubriks = Rubrik
  end

  def new
    @rubrik = Rubrik.new
  end

  def create
    rubrik = Rubrik.new(params[:rubrik])
    if rubrik.save
      redirect_to admin_rubriks_path
    else
      render :new
    end
  end

  def edit
    @rubrik = Rubrik.find(params[:id])
  end

  def update
    rubrik = Rubrik.find(params[:id])
    if rubrik.update_attributes(params[:rubrik])
      redirect_to admin_rubriks_path
    else
      render :edit
    end
  end

  def destroy
    rubrik = Rubrik.find(params[:id])
    rubrik.destroy
    redirect_to admin_rubriks_path
  end
end

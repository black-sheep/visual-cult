class Admin::DecorsController < ApplicationController
  def index
    @decors = Decor
  end

  def new
    @decor = Decor.new
  end

  def create
    decor = Decor.new(params[:decor])
    if decor.save
      redirect_to admin_decors_path
    else
      render :new
    end
  end

  def edit
    @decor = Decor.find(params[:id])
  end

  def update
    decor = Decor.find(params[:id])
    if decor.update_attributes(params[:decor])
      redirect_to admin_decors_path
    else
      rener :new
    end
  end

  def destroy
    decor = Decor.find(params[:id])
    decor.destroy
    redirect_to admin_decors_path
  end
end

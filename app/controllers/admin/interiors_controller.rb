class Admin::InteriorsController < ApplicationController
  def index
    @interiors = Interior
  end

  def new
    @interior = Interior.new
  end

 def create
   interior = Interior.new(params[:interior])
   if interior.save
     redirect_to admin_interiors_path
   else
     render :new
   end
 end

  def edit
    @interior = Interior.find(params[:id])
  end

  def update
    interior = Interior.find(params[:id])
    if interior.update_attributes(params[:interior])
      redirect_to admin_interiors_path
    else
      rener :new
    end
  end

  def destroy
    interior = Interior.find(params[:id])
    interior.destroy
    redirect_to admin_interiors_path
  end
end

class PhotosController < ApplicationController
  include PhotosHelper

  before_filter :load_gallery
  before_filter :check_gallery, only: [:create, :update]

  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = @gallery.photos.new(
        :src_preview    => params[:src_preview],
        :miniature_one  => params[:miniature_one],
        :miniature_two  => params[:miniature_two],
        :name           => params[:name],
        :date_create    => params[:date_create],
        :city           => params[:city],
        :sell           => params[:select][:sell],
        :description    => params[:description],
        :height         => params[:height],
        :width          => params[:width],
        :color_id       => params[:select][:color1],
        :colord_id      => params[:select][:color2],
        :rubrik_id      => params[:select][:rubrik1],
        :rubrikd_id     => params[:select][:rubrik2]
    )
    if @photo.save
      redirect_to user_gallery_photo_path(params[:user_id], @gallery, @photo)
    else
      render :new
    end
  end

  def show
    @photo = @gallery.photos.find(params[:id])
  end

  def edit
  end

  private
  def load_gallery
    @gallery ||= User.find(params[:user_id]).galleries.find(params[:gallery_id])
  end

  def check_gallery
    @gallery = gallery(params[:select][:gallery_id], params[:gallery_name], params[:user_id])
  end

end

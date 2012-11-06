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
        :src_preview   => params[:src_preview],
        :miniature_one => params[:miniature_one],
        :miniature_two => params[:miniature_two],
        :name          => params[:name],
        :date_create   => date_to_db_format(params[:date][:date_create]),
        :city          => params[:city],
        :sell          => params[:select][:sell],
        :description   => params[:description],
        :height        => params[:height],
        :width         => params[:width],
        :color_id      => params[:select][:color1],
        :colord_id     => params[:select][:color2],
        :rubrik_id     => params[:select][:rubrik1],
        :rubrikd_id    => params[:select][:rubrik2],
        :tags          => params[:tags],
        :size_one      => params[:size_one],
        :size_two      => params[:size_two],
        :size_three    => params[:size_three],
        :price_one     => params[:price_one],
        :price_two     => params[:price_two],
        :price_three   => params[:price_three],
        :decor_one     => params[:select][:decor_one],
        :decor_two     => params[:select][:decor_two],
        :decor_three   => params[:select][:decor_three],
        :edition_one   => params[:select][:edition_one],
        :edition_two   => params[:select][:edition_two],
        :edition_three => params[:select][:edition_three],
        :technology_id => params[:select][:technology],
        :raiting       => 0
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

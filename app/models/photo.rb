class Photo < ActiveRecord::Base
  attr_accessible :name, :price, :sell, :src_preview, :miniature_one, :miniature_two, :date_create, :city, :description,
                  :width, :height, :color_id, :colord_id, :rubrik_id, :rubrikd_id, :tags

  mount_uploader :src_preview, SrcPreviewUploader
  mount_uploader :miniature_one, MiniatureOneUploader
  mount_uploader :miniature_two, MiniatureTwoUploader

  belongs_to :gallery
end

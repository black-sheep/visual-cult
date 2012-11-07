class Photo < ActiveRecord::Base
  attr_accessible :name, :price, :sell, :src_preview, :miniature_one, :miniature_two, :date_create, :city, :description,
                  :width, :height, :color_one_id, :color_two_id, :rubrik_one_id, :rubrik_two_id, :tags, :size_one, :size_two,
                  :size_three, :price_one, :price_two, :price_three, :decor_one_id, :decor_two_id, :decor_three_id,
                  :edition_one, :edition_two, :edition_three, :technology_id, :raiting

  mount_uploader :src_preview, SrcPreviewUploader
  mount_uploader :miniature_one, MiniatureOneUploader
  mount_uploader :miniature_two, MiniatureTwoUploader

  belongs_to :gallery
end

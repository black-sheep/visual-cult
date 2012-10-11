class New < ActiveRecord::Base
  attr_accessible :picture, :text, :title, :tags

  mount_uploader :picture, PictureUploader

  validates :title, :presence => true
  validates :text,  :presence => true
  validates :tags,  :presence => true

end

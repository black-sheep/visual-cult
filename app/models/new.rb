class New < ActiveRecord::Base
  attr_accessible :picture, :text, :title

  mount_uploader :picture, PictureUploader

  validates :title, :presence => true

end

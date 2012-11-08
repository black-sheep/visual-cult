class Blog < ActiveRecord::Base
  attr_accessible :picture, :text, :title, :tags

  mount_uploader :picture, PictureUploader

  belongs_to :user

  validates :title, :presence => true
  validates :text,  :presence => true
  validates :tags,  :presence => true
end

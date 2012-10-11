class Gallery < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :photos
  belongs_to :user

  validates :name, :presence => true

  scope :gallery_by_user_id, lambda {|user_id| where('user_id = ?',user_id)}
end

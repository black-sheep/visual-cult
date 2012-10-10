class Gallery < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :user

  validates :name, :presence => true
end

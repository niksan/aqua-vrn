class Service < ActiveRecord::Base

  validates :name, presence: true
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: [:history, :finders]
  mount_uploader :image, ServiceUploader

end

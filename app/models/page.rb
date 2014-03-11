class Page < ActiveRecord::Base

  validate :title, presence: true

  has_ancestry
  extend FriendlyId
  friendly_id :title, use: [:history, :finders]
  
end

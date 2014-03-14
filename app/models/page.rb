class Page < ActiveRecord::Base

  validate :title, presence: true

  has_ancestry
  extend FriendlyId
  friendly_id :title, use: [:history, :finders]
  validate :key, uniqueness: true

  def self.by_key(key)
    where(key: key.to_s).first
  end
  
end

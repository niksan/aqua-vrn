class Service < ActiveRecord::Base

  validates :name, presence: true
  has_ancestry
  extend FriendlyId
  friendly_id :name, use: [:history, :finders]
  mount_uploader :image, ServiceUploader
  before_create :set_position

  default_scope -> { order(:position) }

  protected

    def set_position
      self.position = self.class.unscoped.order(:position).try(:last).try(:position).to_i + 1
    end

end

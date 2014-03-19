module SetPosition
  extend ActiveSupport::Concern

  included do
    before_create :set_position
    default_scope -> { order(:position) }
  end

  protected

    def set_position
      self.position = self.class.unscoped.order(:position).try(:last).try(:position).to_i + 1
    end

end

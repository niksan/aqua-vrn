module SetPosition
  extend ActiveSupport::Concern

  module ClassMethods

    def generate_positions
      self.where('position IS NULL').each{ |i| i.update_attributes(position: i.new_position) }
    end

  end

  included do
    before_create :set_position
    default_scope -> { order(:position) }
  end

  def set_position
    self.position = self.new_position
  end

  def new_position
    self.class.unscoped.order(:position).try(:first).try(:position).to_i + 1
  end

end

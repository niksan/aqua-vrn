module SetPosition
  extend ActiveSupport::Concern

  module ClassMethods

    def generate_positions
      self.where('position IS NULL').each{ |i| i.update_attributes(position: self.next_position) }
    end

    def next_position
      unscoped.where('position IS NOT NULL').order(:position).try(:last).try(:position).to_i + 1
    end

  end

  included do
    before_create :set_position
    default_scope -> { order(:position) }
  end

  def set_position
    self.position = self.next_position
  end

end

class Page < ActiveRecord::Base

  has_ancestry
  friendly_id :title, use: [:history, :finders]
  
end

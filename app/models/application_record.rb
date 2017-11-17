# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.latest(section_name, limit)
    joins(category: { subsection: :section })
      .where('sections.name = ?', section_name)
      .order('created_at DESC')
      .limit(limit)
  end
end

# frozen_string_literal: true

class AddCourseToVideo < ActiveRecord::Migration[5.1]
  def change
    change_column_null :series, :category_id, true
    add_reference :series, :course, foreign_key: true, index: true
    add_reference :videos, :course, foreign_key: true, index: true
  end
end

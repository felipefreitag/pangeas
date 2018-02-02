# frozen_string_literal: true

class CoursesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    authorize Course
    @section = Section.find_by(name: 'Cursos Pangeas')
    subsection_courses = @section.subsections.find_by(name: 'courses')
    @courses = subsection_courses.courses.order(created_at: :desc)
  end

  def show
    @course = Course.find(params[:id])
    authorize @course
    @videos = @course.videos.order(:sorting)
  end

  def watch
    @course = Course.find(params[:id])
    authorize @course
    @videos = @course.videos.order(:sorting)
  end
end

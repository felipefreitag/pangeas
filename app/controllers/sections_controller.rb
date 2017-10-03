# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    latest_videos
  end

  def show
    @section = Section.find(params[:id])
    if @section.name == 'Eventos & Pesquisa'
      show_events
      render :show_events
    elsif @section.name == 'Cursos Pangeas'
      render :show_courses
    elsif @section.name == 'Vida em Equilíbrio'
      show_section
      render :show
    end
  end

  private

  def show_section
    @subsections = @section.subsections
    latest_videos
  end

  def show_events
    @subsections = @section.subsections
    subsection_events = @subsections.find_by(name: 'events')
    highlight_category = subsection_events.categories.find_by(
      name: 'Em destaque'
    )
    @highlight = highlight_category.videos.first ||
                 highlight_category.series.first
    @events = subsection_events.categories.find_by(name: 'Eventos')
    @other_events = subsection_events.categories.find_by(
      name: 'Outros Eventos'
    )
    @talks = subsection_events.categories.find_by(name: 'Palestras Avulsas')
  end

  def latest_videos
    @latest_videos = []
    all_videos = Video.order(:created_at)
    return if all_videos.empty?
    @latest_videos = [
      all_videos.last,
      all_videos.second_to_last,
      all_videos.third_to_last
    ]
  end
end

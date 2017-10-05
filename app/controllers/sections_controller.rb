# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    latest_videos
  end

  def show
    @section = Section.find(params[:id])
    if @section.name == 'Eventos & Pesquisa'
      show_events
    elsif @section.name == 'Cursos Pangeas'
      render :show_courses
    elsif @section.name == 'Vida em Equilíbrio'
      show_section
    end
  end

  private

  def show_section
    @subsections = @section.subsections
    latest_videos
    render :show
  end

  def show_events
    subsection_events = @section.subsections.find_by(name: 'events')
    @events = subsection_events.categories.find_by(name: 'Eventos')
    @highlight = @events.videos.find_by(highlighted: 'true') ||
                 @events.series.find_by(highlighted: 'true')
    @other_events = subsection_events.categories.find_by(name: 'Outros Eventos')
    @talks = subsection_events.categories.find_by(name: 'Palestras Avulsas')
    render :show_events
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

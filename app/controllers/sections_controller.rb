# frozen_string_literal: true

class SectionsController < ApplicationController
  def index
    authorize Section
    @latest_videos = Video.latest('Vida em Equilíbrio')
  end

  def show
    @section = Section.find(params[:id])
    authorize @section
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
    @latest_videos = Video.latest('Vida em Equilíbrio')
    render :show
  end

  def show_events
    subsection_events = @section.subsections.find_by(name: 'events')
    @events = subsection_events.categories.find_by(name: 'Eventos')
    @highlight =
      @events.videos.find_by(highlighted: 'true') ||
      @events.series.find_by(highlighted: 'true')
    @other_events = subsection_events.categories.find_by(name: 'Outros Eventos')
    @talks = subsection_events.categories.find_by(name: 'Palestras Avulsas')
    render :show_events
  end
end

class SectionsController < ApplicationController

  def index
    all_videos = Video.order(:created_at)
    @latest_videos = []
    unless all_videos.empty?
      @latest_videos = [
        all_videos.last,
        all_videos.second_to_last,
        all_videos.third_to_last
      ]
    end
  end

  def show
    @section = Section.find(params[:id])
    @subsections = @section.subsections
    @latest_videos = []

    if @section.name == 'Eventos & Pesquisa'
      subsection_events = @subsections.find_by(name: 'events')
      highlight_category = subsection_events.categories.find_by(name: 'Em destaque')
      @highlight = highlight_category.videos.first || highlight_category.series.first
      @events = subsection_events.categories.find_by(name: 'Eventos')
      @other_events = subsection_events.categories.find_by(name: 'Outros Eventos')
      @talks = subsection_events.categories.find_by(name: 'Palestras Avulsas')
      render :show_events and return

    elsif @section.name == 'Vida em Equilíbrio'
      all_videos = Video.order(:created_at)
      unless all_videos.empty?
        @latest_videos = [
          all_videos.last,
          all_videos.second_to_last,
          all_videos.third_to_last
        ]
      end
      render :show and return
      
    elsif @section.name == 'Cursos Pangeas'
      render :show_courses and return
    end
  end
end

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
    content = {
      date: "XX/XX",
      name: "Nome do conteúdo",
      description: "Pequena descrição do que vai ser, para quem vai ser e o que traz de benefício.",
    }
    @new_content = []
    (1..7).each { @new_content.push(content) }
  end

  def show
    @section = Section.find(params[:id])
    @subsections = @section.subsections
    @latest_videos = []
    if @section.name == 'Eventos & Pesquisa'
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

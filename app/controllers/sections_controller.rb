class SectionsController < ApplicationController

  def index
    @sections = Section.all
    all_videos = Video.order(:created_at)
    @latest_videos = [
      all_videos.last,
      all_videos.second_to_last,
      all_videos.third_to_last
    ]
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
    all_videos = Video.order(:created_at)
    @latest_videos = [
      all_videos.last,
      all_videos.second_to_last,
      all_videos.third_to_last
    ]
    @subsections = @section.subsections
  end
end

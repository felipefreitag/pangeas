class SectionsController < ApplicationController

  def index
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

class SectionsController < ApplicationController

  def index
  end

  def show
    @section = Section.find(params[:id])
    @latest_videos = [
      Video.order(:created_at).last,
      Video.order(:created_at).second_to_last,
      Video.order(:created_at).third_to_last
    ]
  end
end

class SectionsController < ApplicationController

  def index
  end

  def show
    @section = Section.find(params[:id])
    @latest_videos = [Video.last, Video.second_to_last, Video.third_to_last]
  end
end

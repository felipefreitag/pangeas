# frozen_string_literal: true

class VideosController < ApplicationController
  def index
    authorize Video
    return if search_params[:search].blank?
    @videos = Video.where(course_id: nil).search(search_params[:search])
  end

  def show
    @video = Video.find(params[:id])
    authorize @video
  end

  private

  def search_params
    params.permit(:search)
  end
end

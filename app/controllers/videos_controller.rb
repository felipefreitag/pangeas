# frozen_string_literal: true

class VideosController < ApplicationController
  def show
    @video = Video.find(params[:id])
    authorize @video
  end
end

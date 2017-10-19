# frozen_string_literal: true

class VideosController < ApplicationController
  after_action :verify_authorized

  def show
    @video = Video.find(params[:id])
    authorize @video
  end
end

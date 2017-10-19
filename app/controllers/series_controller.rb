# frozen_string_literal: true

class SeriesController < ApplicationController
  after_action :verify_authorized

  def show
    @series = Series.find(params[:id])
    authorize @series
    @videos = @series.videos
  end
end

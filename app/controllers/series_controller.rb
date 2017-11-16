# frozen_string_literal: true

class SeriesController < ApplicationController
  def show
    @series = Series.find(params[:id])
    authorize @series
    @videos = @series.videos.order(:sorting)
  end
end

# frozen_string_literal: true

class SeriesController < ApplicationController

  def show
    @series = Series.find(params[:id])
    @videos = @series.videos
  end
end

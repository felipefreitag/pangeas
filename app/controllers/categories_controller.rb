# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
    @videos = @category.videos
    @series = @category.series
    @latest_video = @category.latest_video
  end
end

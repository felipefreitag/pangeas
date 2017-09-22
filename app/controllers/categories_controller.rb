class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @videos = @category.videos
    @latest_video = @videos.order(:created_at).last
    @series = @category.series
  end
end

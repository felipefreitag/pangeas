class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @videos = @category.videos
    @series = @category.series
    @latest_video = @videos.order(:created_at).last
  end
end

class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @videos = @category.videos
    @series = @category.series
  end
end

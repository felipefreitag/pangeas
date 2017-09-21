class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @videos = @category.videos
    @series = @category.series

    # @videos.each do |video|
    #   video_uri = URI("http://vimeo.com/api/v2/video/#{video.vimeo_id}.json")
    #   json = JSON.parse(Net::HTTP.get(video_uri))
    #   image_url = json[0]['thumbnail_small']
    #   video[:image_url] = image_url
    # end
  end
end

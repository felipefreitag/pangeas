# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    authorize Video
    return if search_params[:query].blank?
    @videos = Video.search(search_params[:query])
  end

  def search_params
    params.permit(:query)
  end
end

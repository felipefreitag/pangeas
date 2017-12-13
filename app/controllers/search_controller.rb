# frozen_string_literal: true

class SearchController < ApplicationController
  skip_after_action :verify_authorized

  def index
    @videos = Video.search(search_params[:query]) if search_params.present?
  end

  def search_params
    params.permit(:query)
  end
end

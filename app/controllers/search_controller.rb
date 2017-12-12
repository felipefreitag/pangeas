# frozen_string_literal: true

class SearchController < ApplicationController
  skip_after_action :verify_authorized

  def index
    params[:query].present? && @videos = Video.search(params[:query])
  end
end

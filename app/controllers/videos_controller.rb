# frozen_string_literal: true

class VideosController < ApplicationController
  # after_action :verify_authorized, except: %i[index]
  # after_action :verify_policy_scoped, only: %i[index]

  def show
    @video = Video.find(params[:id])
  end
end

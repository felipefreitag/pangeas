class SectionsController < ApplicationController

  def index
  end

  def show
    @section = Section.find(params[:id])
  end
end

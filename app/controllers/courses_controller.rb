# frozen_string_literal: true

class CoursesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def show
    @course = Course.find(params[:id])
  end
end

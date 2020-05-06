class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def index
    @videos = Video.all
  end
end

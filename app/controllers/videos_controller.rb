class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @video = Video.new
  end

  def index
    @videos = Video.all
  end

  def create
    @video = Video.new(video_params)
    @video.room_id = Ro
    binding.pry
    if @video.save
      redirect_to videos_path, notice: "新規の動画が投稿されました。"
    else
      flash.now[:alert] = "動画の投稿に失敗しました。"
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  private
  def video_params
    params.require(:video).permit(:room_id, :name)
  end

end

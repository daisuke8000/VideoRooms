class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @room = Room.find(params[:room_id])
    @video = @room.videos.build(video_params)
    if @video.save
      flash[:notice] = "新規の動画が投稿されました。"
      redirect_to controller: "rooms", action: "show", id: @room.id
    else
      flash.now[:alert] = "動画の投稿に失敗しました。"
      render :new
    end
  end

  def show
    @video = Video.find(params[:room_id])
  end

  def destroy
    video = Video.find(params[:room_id])
    video.destroy
    redirect_to room_path
  end

  private
  def video_params
    params.require(:video).permit(:video_name)
  end

end

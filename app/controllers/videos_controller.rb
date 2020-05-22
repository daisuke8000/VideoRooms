class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    @room = Room.find(params[:room_id])
    @video = @room.videos.build(video_params)
    @video.youtube_url = @video.channel
    if @video.save
      flash[:notice] = '新規の動画が投稿されました。'
      redirect_to controller: 'rooms', action: 'show', id: @room.id
    else
      flash.now[:alert] = '動画の投稿に失敗しました。'
      render :new
    end
  end

  def show
    @video = Video.find(params[:room_id])
  end

  def update
    @room = Room.find(params[:room_id])
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to controller: 'rooms', action: 'show', id: @room.id
      flash[:success] = '動画を編集しました。'
    else
      flash.now[:alert] = '動画の編集に失敗しました。'
      render :edit
    end
  end

  def edit
    @room = Room.find(params[:id])
    @video = Video.find(params[:room_id])
  end

  def destroy
    video = Video.find(params[:room_id])
    video.destroy
    redirect_to room_path
  end

  private
  def video_params
    params.require(:video).permit(:video_name, :youtube_url)
  end

end

class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path,notice: "新規の部屋が作成されました。"
    else
      flash.now[:alert] = "新規の部屋に失敗しました。"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(room_params)
      redirect_to rooms_path
      flash[:success] = "部屋を編集しました。"
    else
      flash.now[:alert] = "部屋の編集に失敗しました。"
      render :edit
    end
  end


  def edit
    @room = Room.find(params[:id])
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:title)
  end


end

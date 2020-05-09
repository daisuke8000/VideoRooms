class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @room = Room.new
  end

  def index
    @rooms = Room.all
  end

  def create
    #　フォームから送られてくるストロングパラメータ
    @room = Room.new(room_params)
    ###binding.pry
    #　deviceのhelpermethod "current_user(サインインしているユーザーを取得)"
    #　"current_user.id"　でユーザーIDを追加代入（フォームからは渡されていないパラメータの為）
    @room.user_id = current_user.id
    ###binding.pry
    if @room.save
      redirect_to rooms_path,notice: "新規の部屋が作成されました。"
    else
      flash.now[:alert] = "新規の部屋の作成に失敗しました。"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    # 以下、modelの関連付けにより "子に紐づく親要素" を呼び出している
    # "room" に紐づく親要素は "user" (一意)のみのため、単数形 "user" で呼び出す
    # model "user.rb","room.rb" を参照
    @user = @room.user
    @videos = @room.videos
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

  #ストロングパラメータのカラム
  private
  def room_params
    params.require(:room).permit(:room_name)
  end


end

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # 以下、modelの関連付けにより "親に紐づく子要素" を呼び出している
    # "user" に紐づく子要素は "rooms"（多義）のため、複数形 "rooms" で呼び出す
    # model "user.rb","room.rb" を参照
    @rooms = @user.rooms
  end
end

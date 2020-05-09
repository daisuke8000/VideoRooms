class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #====以下、関連付けの記述====================================================
  # has_many => このmodelに紐づく "子のmodel" （Railsの命名規則から複数形で指定する）
  # 詳細はER図参照（daisuke_portfolio1.puml）
  #========================================================================
  has_many :rooms
end

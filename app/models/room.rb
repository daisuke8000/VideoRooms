class Room < ApplicationRecord
  validates :room_name, presence: true
  #====以下、関連付けの記述====================================================
  # belongs_to => このmodelに紐づく "親のmodel" （Railsの命名規則から"単数形"で指定する）
  # has_many => このmodelに紐づく "子のmodel" （Railsの命名規則から"複数形"で指定する）
  # 詳細はER図参照（daisuke_portfolio1.puml）
  #========================================================================
  belongs_to :user
  has_many :videos
end

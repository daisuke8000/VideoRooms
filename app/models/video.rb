class Video < ApplicationRecord
  #====以下、関連付けの記述===================================================
  # belongs_to => このmodelに紐づく "親のmodel" （Railsの命名規則から単数形で指定する）
  # 詳細はER図参照（daisuke_portfolio1.puml）
  #=======================================================================
  belongs_to :room
end

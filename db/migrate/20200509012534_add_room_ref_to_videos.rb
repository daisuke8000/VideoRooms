class AddRoomRefToVideos < ActiveRecord::Migration[6.0]
  def change
    add_reference :videos, :room, null: false, foreign_key: true
  end
end

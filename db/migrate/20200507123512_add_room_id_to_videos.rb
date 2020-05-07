class AddRoomIdToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :room_id, :integer
  end
end

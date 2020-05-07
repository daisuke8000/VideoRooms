class RenameTitleColumnToRooms < ActiveRecord::Migration[6.0]
  def change
    rename_column :rooms, :title, :room_name
  end
end

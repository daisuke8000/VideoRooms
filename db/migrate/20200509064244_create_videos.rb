class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :video_name
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end

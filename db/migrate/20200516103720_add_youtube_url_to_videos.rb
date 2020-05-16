class AddYoutubeUrlToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :youtube_url, :string
  end
end

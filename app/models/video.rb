class Video < ApplicationRecord
  belongs_to :room

  def fetch_from_url
    if self.youtube_url.present?
      url_id = 'v=(.{11})'
      youtube_url.match(/#{url_id}/)[1]
    end
  end
end

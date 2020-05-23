class Video < ApplicationRecord
  belongs_to :room
  URL_STRING_REGEX = /v=(.{11})/

  def fetch_from_url
    if self.youtube_url.present?
      youtube_url.match(URL_STRING_REGEX)[1]
    end
  end
end

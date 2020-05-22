class Video < ApplicationRecord
  belongs_to :room

  def channel
    if self.youtube_url != ""
      return youtube_url.match(/v=(.{11})/)[1]
    end
  end
end

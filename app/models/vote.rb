class Vote < ActiveRecord::Base
  belongs_to :track
  belongs_to :user

  validates :track_id, presence: true
  validates :user_id, presence: true

  def self.count_votes(track_id)
    if track_id
      track_id.to_i
      self.where(track_id: track_id).count
    end
  end

end
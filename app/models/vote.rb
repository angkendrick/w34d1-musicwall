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

  def self.vote_check(track_id, user_id)
    if track_id && user_id
      track_id.to_i
      user_id.to_i
      container = self.where(track_id: track_id).where(user_id: user_id)
      container.count == 0 ? false : true
    end
  end

end
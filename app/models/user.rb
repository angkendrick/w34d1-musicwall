class User < ActiveRecord::Base
  validates :user, presence: true
  validates :password, presence: true
  validates :name, presence: true

  def self.authenticate(user, password)
    user = self.find_by(user: user)
    if !user.nil?
      user.password == password
    else
      false
    end
  end

end



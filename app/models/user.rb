class User < ActiveRecord::Base
  validates :user, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true

  def self.authenticate(user, password)
    user = self.find_by(user: user)
    if user
      user.password == password
    else
      false
    end
  end

  def self.getname(user)
    user = self.find_by(user: user)
    if user
      user.name
    else
      false
    end
  end

end



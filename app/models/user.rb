class User < ActiveRecord::Base
  validates :user, :presence true
  validates :password, :presence true
  validates :name, :presence true
end
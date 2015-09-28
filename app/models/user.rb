class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username
  validates_presence_of :name

  has_many :posts
  has_many :comments
end

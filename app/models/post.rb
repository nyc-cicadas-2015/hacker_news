class Post < ActiveRecord::Base
  validates_presence_of :url
  validates_presence_of :title

  belongs_to :user
  has_many :comments
end

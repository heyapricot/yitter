class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, as: :record

  validates_presence_of :content
end

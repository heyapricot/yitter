class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_person_name

  has_many :posts, dependent: :destroy
  has_many :likes

  validates_presence_of :first_name, :last_name

  LIKE_LIMIT = 5
end

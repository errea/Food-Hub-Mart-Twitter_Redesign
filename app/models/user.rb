class User < ApplicationRecord
  has_one_attached :image
  has_one_attached :cover_image

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 12 }
  validates :fullname, presence: true, length: { minimum: 5, maximum: 20 }

  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  validates :cover_image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :opinions, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :follows, through: :followings, source: :followed
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followers, through: :inverse_followings, source: :follower

  def who_to_follow
    User.where.not(id: id).where.not(id: follows).order('created_at DESC')
  end
end

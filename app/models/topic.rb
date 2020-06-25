class Topic < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 100 }
  validates :lat, presence: true
  validates :lng, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
end

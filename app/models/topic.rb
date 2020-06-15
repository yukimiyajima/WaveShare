class Topic < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :user_id, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true

  mount_uploader :icon, IconUploader

  has_many :topics, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :like_topics, through: :likes, source: :topic
end

class Diary < ApplicationRecord
  has_many_attached :image
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :image_emotions, dependent: :destroy
end

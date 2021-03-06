class Diary < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :image_emotions, dependent: :destroy

  accepts_nested_attributes_for :image_emotions, reject_if: :all_blank, allow_destroy: true
end

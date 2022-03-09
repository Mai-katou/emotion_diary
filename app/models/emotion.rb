class Emotion < ApplicationRecord
  has_many :image_emotions, dependent: :destroy
end

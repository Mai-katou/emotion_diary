class ImageEmotion < ApplicationRecord
  belongs_to :diary
  belongs_to :emotion
end

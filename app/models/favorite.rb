class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :post_image

  # 19章user_idとpost_image_idのペアが一意である（重複しない）状態に制限するためのバリデーション
  validates :user_id, uniqueness: {scope: :post_image_id}

end

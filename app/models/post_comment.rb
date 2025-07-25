class PostComment < ApplicationRecord
  # UserモデルとPostCommentモデルを関連付ける記述
  belongs_to :user
  belongs_to :post_image
end

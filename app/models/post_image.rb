class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # ↓18章で追加、PostImageモデルとPostCommentモデルを関連付ける記述
  has_many :post_comments, dependent: :destroy
  # ↓19章で追加。フェイバリット（いいね機能）との連携
  has_many :favorites, dependent: :destroy

  #shop_nameが存在しているかを確認するバリデーション
  validates :shop_name, presence: true
  #imageが存在しているかを確認するバリデーション
  validates :image, presence: true
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  # ↓19章
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

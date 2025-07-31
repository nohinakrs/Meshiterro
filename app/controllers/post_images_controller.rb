class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

# 投稿データの保存、21章でバリデーション実装
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    #22章で追記、kaminariの機能でpageメソッドを使用、1ページ分の決められた数のデータだけを、新しい順に取得するように変更
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to '/post_image'
    end
  end

# 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end

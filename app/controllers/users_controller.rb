class UsersController < ApplicationController
  def show
    @user = user.id
    @post_images = @user.post_images    
  end

  def edit
    @user = user.id
  end

  def update
    @user = user.find(params[:id])
    @user.update(user_params)
    redirect_to book_path(@book.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end

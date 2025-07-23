class UsersController < ApplicationController
  def show
    @user = user.id
    @post_images = @user.post_images    
  end

  def edit
  end
end

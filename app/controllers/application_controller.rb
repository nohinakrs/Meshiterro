class ApplicationController < ActionController::Base
  # 21章で一行↓追加。ログインしていない状態でトップページ以外にアクセスされた場合は、ログイン画面へリダイレクトする機能
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

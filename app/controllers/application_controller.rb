class ApplicationController < ActionController::Base
  # 21章で一行↓追加。ログインしていない状態でトップページ以外にアクセスされた場合は、ログイン画面へリダイレクトする機能
  #　構造改善により記述を変更
 # before_action :authenticate_user!, except: [:top]
 # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top], unless: :admin_controller?

  #def after_sign_in_path_for(resource)
  #  post_images_path
  #end


 # def after_sign_out_path_for(resource)
 #  about_path
 # end
#↑移動

  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
  # 管理者のみ全てのユーザーに対して操作出来る権限を付与する記述

 # protected

 # def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
 # end
 #↑移動（sessionsコントローラーへ）
end
class ApplicationController < ActionController::Base
  #以下最終的な編集結果
  before_action :configure_authentication
 
  private

 #現在のコントローラーが管理者用かどうかに基づいて適切な認証メソッド（authenticate_user! または authenticate_admin!）を呼び出すす。
 #このメソッドはbefore_actionで実行されます。
  def configure_authentication
    if admin_controller?
      authenticate_admin!
    else
    #コントローラーがhomesかつtopアクションではない場合にfalseが返りauthenticate_user!が実行されます。
      authenticate_user! unless action_is_public?
    end
  end
 
  #現在のコントローラーがAdmin名前空間の下にあるかどうかを判定
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
 
  #特定のアクション（この例ではhomes#top）が認証が不要かどうかを判定
  def action_is_public?
    controller_name == 'homes' && action_name == 'top'
  end
  # 21章で一行↓追加。ログインしていない状態でトップページ以外にアクセスされた場合は、ログイン画面へリダイレクトする機能
  #　構造改善により記述を変更
 # before_action :authenticate_user!, except: [:top]
 # before_action :configure_permitted_parameters, if: :devise_controller?
 #第一段階の改善↓
 # before_action :authenticate_user!, except: [:top], unless: :admin_controller?

  #def after_sign_in_path_for(resource)
  #  post_images_path
  #end


 # def after_sign_out_path_for(resource)
 #  about_path
 # end
#↑移動

#第一段階の改善↓
 # private
 
 # def admin_controller?
 #   self.class.module_parent_name == 'Admin'
 # end
  # 管理者のみ全てのユーザーに対して操作出来る権限を付与する記述

 # protected

 # def configure_permitted_parameters
 #第一段階の改善↓
  #  devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
 # end
 #↑移動（sessionsコントローラーへ）
end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

    # ヘルパーメソッドをオーバーライド
    def after_sign_in_path_for(resource)
      flash[:notice] = "ログインに成功しました"
      user_path(current_user.id)
    end

    def after_sign_out_path_for(resource)
      flash[:notice] = "ログアウトに成功しました"
      new_user_session_path
    end

end

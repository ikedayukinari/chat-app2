class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #nameカラムを追加したので、このメソッドを使用してnameキーの内容を保存する為にpermitメソッドで許可している
  end
end #devise_parameter_sanitizerメソッドは、ユーザー登録をする場合に使うことができ、特定のカラムを許容するメソッド

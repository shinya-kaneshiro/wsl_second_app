class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  # params内容を元に対象ユーザーオブジェクトを取得する。
  def set_user
    @user = User.find(params[:format])
  end

  # 対象のArticleレコードをインスタンス変数に格納する。
  def set_article
    @article = Article.find(params[:id])
  end

  # Article.newをインスタンス変数に格納する。
  def set_article_new
    @article = Article.new
  end

  # Article.allをインスタンス変数に格納する。
  def set_articles
    @articles = Article.all
  end

  # ログイン済みのユーザーか確認し、未ログインならログインページへ遷移させる。
  def logged_in_user
    unless logged_in?
      # store_location
      flash[:danger] = "該当ページへアクセスするにはログインしてください。"
      redirect_to user_session_path
    end
  end

  # StrongParameterの対象にnameカラムを追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # ログイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
      users_dash_boards_index_path(resource)
  end

  ### session
  # ログイン中ユーザーの有無を判定
  def logged_in?
    !current_user.nil?
  end

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end

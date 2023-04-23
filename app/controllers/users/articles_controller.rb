class Users::ArticlesController < ApplicationController
  before_action :set_articles, only: [:index]
  before_action :set_article_new, only: [:new]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def index
  end

  def show
  end

  def new
  end

  def create
    article = Article.new(article_params)
    if article.save
      flash[:success] = "記事を新規作成しました。"
      redirect_to users_articles_show_path(id: article.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "内容を更新しました。"
      redirect_to users_articles_show_path(id: @article.id)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "「記事ID: #{@article.id}」を削除しました。"
    redirect_to users_articles_index_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end
end

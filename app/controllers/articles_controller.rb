class ArticlesController < ApplicationController

  def index
    render locals: { articles: Article.all }
  end

  def show
    render locals: { article: article }
  end

  def new
    render locals: { article: Article.new }
  end

  def create
    article = Article.create!(article_params)
    flash.notice = "Article '#{article.title}' Created!"
    redirect_to article_path(article)
  end

  def destroy
    title = article.title
    article.destroy
    flash.notice = "Article '#{title}' Deleted!"
    redirect_to articles_path
  end

  def edit
    render locals: { article: article }
  end

  def update
    Article.update(article_params)

    flash.notice = "Article '#{article.title}' Updated!"
    # ...savior of the universe...

    redirect_to article_path(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def article
    Article.find(params[:id])
  end
end

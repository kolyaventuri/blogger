class ArticlesController < ApplicationController
  def index
    render locals: { articles: Article.all }
  end
end
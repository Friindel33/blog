class HomeController < ApplicationController
  def index
        @articles = Article.all
        @article = Article.find(params[:id])
  end
end

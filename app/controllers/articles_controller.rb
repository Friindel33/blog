class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  before_action :set_search

  def set_search
    @q=Article.search(params[:q])
  end

  def show
    @articles = Article.all
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text, :author))
    @article.author = current_user.username

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
      @article=Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
  end

private

  def article_params
    params.require(:article).permit(:title, :text, :author)
  end
end

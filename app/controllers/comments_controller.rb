class CommentsController < ApplicationController
  def create
    @articles = Article.all
    @article = Article.find(params[:article_id])
    @comments = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end
    private

    def comment_params
      params.require(:comment).permit(:author, :body)
    end
end

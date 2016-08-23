class ArticlesController < ActionController::Base
  def new
    @article=Article.new
  end
  def create
    @article=Article.new(article_params)
    @article.save
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
      redirect_to article_show(@article)
    end
end

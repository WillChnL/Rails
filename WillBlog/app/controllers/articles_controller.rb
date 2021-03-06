class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Successfully updated"
      redirect_to article_path
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Successfully created..."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Successfully deleted"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end

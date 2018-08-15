class ArticlesController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update(update_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :details)
  end

  def update_params
    params.require(:article).permit(:title, :details, :completed)
  end

  def find
    @article = article.find(params[:id])
  end
end

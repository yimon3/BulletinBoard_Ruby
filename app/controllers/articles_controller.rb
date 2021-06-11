class ArticlesController < ApplicationController
    def index
      @articles = ArticlesService.listAll
    end

    def show
      @article = ArticlesService.findArticleById(params[:id])
    end

    def new
      @article = ArticlesService.newArticle
    end

    def create
      isSaveArticle = ArticlesService.createArticle(article_params)
        if isSaveArticle
          redirect_to articles_path
        else
          render :new
        end
    end

    def edit
      @article = ArticlesService.findArticleById(params[:id])
    end

    def update
      isUpdateArticle = ArticlesService.updateArticle(params[:id],article_params)
      if isUpdateArticle
          redirect_to articles_path
      else
          render :edit
      end
    end

    def destroy
        ArticlesService.deleteArticle(params[:id])
        redirect_to root_path
    end

    private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end

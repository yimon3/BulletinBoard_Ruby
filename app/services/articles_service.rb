class ArticlesService
    class << self
        def listAll
            @articles = ArticlesRepository.listAll
        end

        def newArticle
            @article = ArticlesRepository.newArticle
        end

        def createArticle(article)
            isSaveArticle = ArticlesRepository.createArticle(article)
        end

        def findArticleById(id)
            @article = ArticlesRepository.findArticleById(id)
        end

        def updateArticle(id,article_form)
            @article = ArticlesRepository.findArticleById(id)
            isUpdateArticle = ArticlesRepository.updateArticle(@article,article_form)
        end

        def deleteArticle(id)
            @article = ArticlesRepository.findArticleById(id)
            ArticlesRepository.deleteArticle(@article)
        end
    end
end
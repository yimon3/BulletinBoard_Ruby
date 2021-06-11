class ArticlesRepository
    class << self
        def listAll
            @articles = Article.all
        end

        def newArticle
            @article = Article.new
        end

        def createArticle(article)
            @article = Article.new(article)
            isSaveArticle = @article.save
        end

        def findArticleById(id)
            @article = Article.find(id)
        end

        def updateArticle(article,article_form)
            isUpdateArticle = article.update(article_form)
        end

        def deleteArticle(article)
            article.destroy
        end
    end
end
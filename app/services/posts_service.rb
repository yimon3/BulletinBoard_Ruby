class PostsService
    class << self
        def newPost
            @post = PostsRepository.newPost
        end

        def listAll
            @post = PostsRepository.listAll
        end

        def showPost(id)
            @post = PostsRepository.findPostById(id)
        end

        def editPost(id)
            @post = PostsRepository.findPostById(id)
        end

        def createPost(post, id)
            isSavePost = PostsRepository.createPost(post, id)
        end

        def deletePost(id)
            isDeletePost = PostsRepository.deletePost(id)
        end

        def updatePost(id, post, user_id)
            isUpdatePost = PostsRepository.updatePost(id, post, user_id)
        end

    end
end
class PostsRepository
    class << self
        def newPost
            @post = Post.new
        end

        def listAll
            @post = Post.all
        end

        def findPostById(id)
            @post = Post.find(id)
        end

        def createPost(post, id)
            @post = Post.new(post)
            @post.create_user_id = id
            @post.updated_user_id = id
            isSavePost = @post.save
        end

        def deletePost(id)
            findPostById(id).destroy
        end

        def updatePost(id, post, user_id)
            @post = findPostById(id)
            @post.updated_user_id = user_id
            @post.updated_at = Time.now
            @post.update(post)
        end

    end
end
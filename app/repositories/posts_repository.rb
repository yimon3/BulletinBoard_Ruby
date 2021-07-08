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

        def confirmPost(post)
            @post = Post.new(post)
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

        def searchPost(param)
            to_send_back = (title_matches(param) + description_matches(param)).uniq
            return nil unless to_send_back
            to_send_back
        end
      
        def title_matches(param)
            matches('title', param)
        end
      
        def description_matches(param)
            matches('description', param)
        end
      
        def matches(field_name, param)
            Post.where("#{field_name} LIKE ?" , "%#{param}")
        end

    end
end
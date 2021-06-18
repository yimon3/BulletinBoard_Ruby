class UsersService
    class << self
        def createUser(user, id)
            isSaveUser = UsersRepository.createUser(user, id)
          end
        
          def listAll
            @user = UsersRepository.listAll
          end
        
          def deleteUser(id)
            isDeletePost = ArticlesRepository.deleteUser(id)
          end 
    end
end
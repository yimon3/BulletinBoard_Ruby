class UsersService
    class << self
        def createUser(user, id)
            isSaveUser = UsersRepository.createUser(user, id)
          end
        
          def listAll
            @user = UsersRepository.listAll
          end
        
          def deleteUser(id)
            isDeletePost = UsersRepository.deleteUser(id)
          end 

          def editProfile(id)
            @user = UsersRepository.findUserById(id)
          end

          def updateProfile(id, userId, user)
            @user = UsersRepository.updateProfile(id, userId, user)
          end

          def showProfile(id)
            @user = UsersRepository.findUserById(id)
          end
    end
end
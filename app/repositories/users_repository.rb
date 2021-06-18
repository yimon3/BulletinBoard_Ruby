class UsersRepository
    class << self
        def createUser(user, id)
            @user = User.new(user)
            if @user.user_type == 'Admin'
              @user.user_type= 0
              assignUser
            elsif @user.user_type == 'User'
              @user.user_type= 1
              assignUser
            end
              isSaveUser = @user.save
          end
        
          def findUserById(id)
            @user = User.find(id)
          end

          def listAll
            @user = User.all
          end
        
          def deleteUser(id)
            findUserById(id).destroy
          end

          def assignUser
            @user.create_user_id = id
            @user.updated_user_id = id
          end
          
    end
end
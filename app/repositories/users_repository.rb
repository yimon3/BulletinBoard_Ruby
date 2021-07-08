class UsersRepository
    class << self
        def createUser(user, id)
            @user = User.new(user)
            if @user.user_type == 'Admin'
              @user.user_type= 0
              assignUser(id)
            elsif @user.user_type == 'User'
              @user.user_type= 1
              assignUser(id)
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

          def assignUser(id)
            @user.create_user_id = id
            @user.updated_user_id = id
          end

          def updateProfile(id, user, user_id)
            @user = findUserById(id) 
            @user.updated_user_id = user_id
            @user.updated_at = Time.now
            @user.update(user)
          end
          
          def searchUserByName(name)
            to_send_back = name_matches(name).uniq
            return nil unless to_send_back
                to_send_back
          end

          def searchUserByEmail(email)
            to_send_back = email_matches(email).uniq
            return nil unless to_send_back
                to_send_back
          end
    
          def name_matches(name)
            matches('name', name)
          end

          def email_matches(email)
            matches('email', email)
          end

          def matches(field_name, param)
            User.where("#{field_name} LIKE ?", "%#{param}")
          end
          
    end
end
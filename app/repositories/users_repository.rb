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
          
          def searchUser(name, email, from_date, to_date)
            to_send_back = name_matches(name) if name.present?
            to_send_back = email_matches(email) if email.present?
            to_send_back = fromDate_matches(from_date) if from_date.present?
            to_send_back = toDate_matches(to_date) if to_date.present?
            return nil unless to_send_back
                to_send_back
          end
    
          def name_matches(name)
            matches('name', name)
          end

          def email_matches(email)
            matches('email', email)
          end

          def fromDate_matches(from_date)
            fromDate('created_at', from_date)
          end

          def toDate_matches(to_date)
            toDate('created_at', to_date)
          end

          def matches(field_name, param)
            User.where("#{field_name} LIKE ?", "%#{param}")
          end

          def fromDate(field_name, param)
            User.where("#{field_name} >= ?", "%#{param}")
          end

          def toDate(field_name, param)
            User.where("#{field_name} <= ?", "%#{param}")
          end
          
    end
end
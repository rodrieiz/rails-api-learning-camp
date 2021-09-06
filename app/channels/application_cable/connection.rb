module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user(request.params[:token])
      logger.add_tags 'ActionCable', current_user.id
    end

    private

    def find_verified_user(token)
      # For now the token is the user id
      user = User.find_by(id: token)
      unless user.nil?
        return user
      else
        return reject_unauthorized_connection
      end
    end
  end
end

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    private

    def find_verified_user(token)
      session = Session.find_by(token: token)
      unless session.nil?
        return session.user
      else
        return reject_unauthorized_connection
      end
    end

    def connect
      self.current_user = find_verified_user(request.params(:token))
      logger.add_tags 'ActionCable', current_user.id
    end
  end
end

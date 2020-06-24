class User < ApplicationRecord
    validates :email, :session_token, uniqueness: true, presence: true

    def generate_token
        token = SecureRandom.urlsafe_base64(16)
        token
    end

    def reset_session_token!
        session_token = generate_token
        self.save!    
        session_token
    end
end


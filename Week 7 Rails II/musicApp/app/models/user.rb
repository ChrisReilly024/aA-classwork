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

    def password=(password)
        @password = password
        password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)    
        if user && user.is_password?(password) 
            user 
        else
            nil
        end
    end
end
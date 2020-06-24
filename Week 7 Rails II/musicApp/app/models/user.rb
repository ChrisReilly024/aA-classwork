class User < ApplicationRecord
    validates :email, :session_token, uniqueness: true, presence: true

    def generate_token
        token = SecureRandom.urlsafe_base64(16)
        token
    end
end


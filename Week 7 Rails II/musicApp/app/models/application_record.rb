class ApplicationRecord < ActiveRecord::Base
  validates :email, :session_token, uniqueness: true, presence: true
end

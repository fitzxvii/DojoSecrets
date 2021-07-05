class User < ApplicationRecord
    has_secure_password
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :name, presence: true
    before_save { |user| user.email = user.email.downcase }
    has_many :secrets
    has_many :likes, dependent: :destroy
    has_many :secrets_liked, through: :likes, source: :secret
end

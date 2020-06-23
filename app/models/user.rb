class User < ApplicationRecord
  
  validates :name, presence: true, length: { minimum: 1, maximum: 15} 
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 8, maximum: 32}    
  VALID_PASSWORD_REGEX = /\A(?=.*?[A-z])[A-z\d]{8,32}+\z/
  validates :password, presence: true, length: { minimum: 8, maximum: 32}, format: { with: VALID_PASSWORD_REGEX}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  
end

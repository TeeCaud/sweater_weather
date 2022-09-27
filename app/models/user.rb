class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  has_secure_password
  validates_uniqueness_of :email
end

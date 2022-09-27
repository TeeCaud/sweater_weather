class User < ApplicationRecord
  validates_presence_of :email, presence: true
  validates_presence_of :password
  validates_presence_of :password_digest
  validates_uniqueness_of :email
  has_secure_password

  before_save :create_api_key

  def create_api_key
    self.api_key = SecureRandom.hex
  end
end

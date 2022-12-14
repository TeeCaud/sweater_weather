require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }

    it { should validate_uniqueness_of :email }
  end

  describe 'passwords' do
    it 'validates password' do
      user = User.create!(email: 'test@test123.com', password: 'password123', password_confirmation: 'password123')

      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq('password123')
    end

    it 'creates api_key' do
      user = User.new(email: 'test@test123.com', password: 'password123', password_confirmation: 'password123')

      expect(user.api_key).to eq(nil)
      user.save
      expect(user.api_key).to_not eq(nil)
    end
  end
end

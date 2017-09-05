require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(User.new({
        name: 'foot shoes',
        email: 'kyle.w.r@hotmail.com',
        password: '351797asd'
      })).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.new(password: nil)
      expect(user).to_not be_valid
    end
    it "is not valid if email is wrong format" do
      user = User.new({
        name: 'kyle',
        email: 'kyle.w..com',
        password: '351797asd'
      })
      expect(user).to_not be_valid
    end
    it "is not valid if password is less than 6 characters" do
      user = User.new({
        name: 'kyle',
        email: 'kyle.w..com',
        password: '35179'
      })
      expect(user).to_not be_valid
    end
    it "is still valid if email is padded with spaces" do
      user = User.new({
        name: 'kyle',
        email: 'kyle.w.r@hotmail.com ',
        password: '351797asd'
      })
      expect(user).to be_valid
    end
  end
    it 'will login if credentials are correct' do
      user = User.create({
        name: 'kyle',
        email: 'kyle.w.r@hotmail.com',
        password: '351797asd'
      })
      expect(User.authenticate_with_credentials('kyle.w.r@hotmail.com','351797asd')).to eq(user)
    end
   end
end

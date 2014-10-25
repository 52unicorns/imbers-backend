require 'rails_helper'

describe User do
  describe '.from_facebook!' do
    it 'can create a new user from Facebook' do
      fb_user = Facebook::User.new 'id' => '123'
      user    = User.from_facebook!(fb_user)

      expect(user).to be_persisted
      expect(user.facebook_uid).to eq fb_user.id
    end

    it 'can return an existing user by Facebook' do
      existing = User.create! facebook_uid: '123'
      user     = User.from_facebook!(Facebook::User.new('id' => '123'))

      expect(user).to eq existing
    end
  end
end

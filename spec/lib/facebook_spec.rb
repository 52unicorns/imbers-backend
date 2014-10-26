require 'rails_helper'

describe Facebook do
  describe '.friends' do
    it 'returns friends of the given user', :vcr do
      access_token = FIXTURES[:friend_access_token]
      friends = Facebook.friends(access_token)

      expect(friends.size).to eq 2
      expect(friends[0]['id']).to be_present
      expect(friends[0]['name']).to be_present
    end
  end

  describe '.likes' do
    it 'returns likes of the given user', :vcr do
      access_token = FIXTURES[:like_access_token]
      likes = Facebook.likes(access_token)

      expect(likes.size).to eq 1
      expect(likes[0]['id']).to be_present
      expect(likes[0]['name']).to be_present
    end
  end
end

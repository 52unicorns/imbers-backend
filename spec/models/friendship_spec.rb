require 'rails_helper'

describe Friendship do
  describe '.create' do
    it 'creates a friendship between a user and a friend' do
      user = create :user
      friend = { 'id' => 1, 'name' => 'John Doe' }

      Friendship.create(user, friend)

      user_node = Neography::Node.find('user_index', 'uid', user.facebook_uid)
      expect(user_node.outgoing(:friends).size).to eq 1
      expect(user_node.incoming(:friends).size).to eq 1
    end
  end
end

require 'rails_helper'

describe Like do
  describe '.create' do
    it 'associates the like with the user' do
      user = create :user
      like = { 'id' => 1, 'name' => 'Starbucks' }

      Neography::Node.create_unique('user_index', 'uid', user.facebook_uid,
                                    'uid' => user.facebook_uid,
                                    'name' => user.full_name)
      Like.create(user, like)

      user_node = Neography::Node.find('user_index', 'uid', user.facebook_uid)
      expect(user_node.outgoing(:likes).size).to eq 1
    end
  end
end

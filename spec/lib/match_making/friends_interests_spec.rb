require 'rails_helper'

describe MatchMaking::FriendsInterests do
  include SpecSupport::Neo4jHelpers

  let(:user) { create :user }
  let(:friend) { double 'Friend', facebook_uid: '101', full_name: 'Jimmy' }
  let(:person) { double 'Person', facebook_uid: '99', full_name: 'John' }
  let(:like) { double 'Stuff', id: '33', name: 'Starbucks' }

  it 'returns people with similar interests and mutal friends' do
    user_node   = create_user_node(user)
    person_node = create_user_node(person)
    friend_node = create_user_node(friend)
    like_node   = create_like_node(like)

    user_node.both(:friends) << friend_node
    friend_node.both(:friends) << person_node

    user_node.outgoing(:likes) << like_node
    person_node.outgoing(:likes) << like_node

    records = MatchMaking::FriendsInterests.call(user)
    expect(records[0]).to eq person.facebook_uid
  end
end

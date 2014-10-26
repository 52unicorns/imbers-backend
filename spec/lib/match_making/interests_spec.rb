require 'rails_helper'

describe MatchMaking::Interests do
  include SpecSupport::Neo4jHelpers

  let(:user) { create :user }
  let(:person) { double 'Person', facebook_uid: '99', full_name: 'John' }
  let(:like) { double 'Stuff', id: '33', name: 'Starbucks' }

  it 'returns people with similar interests' do
    user_node   = create_user_node(user)
    person_node = create_user_node(person)
    like_node   = create_like_node(like)

    user_node.outgoing(:likes) << like_node
    person_node.outgoing(:likes) << like_node

    records = MatchMaking::Interests.call(user)
    expect(records[0]).to eq person.facebook_uid
  end
end

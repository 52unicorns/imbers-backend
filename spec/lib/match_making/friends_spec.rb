require 'rails_helper'

describe MatchMaking::Friends do
  let(:user) { create :user }
  let(:friend1) { double 'Friend 1', facebook_uid: '99', full_name: 'John' }
  let(:friend2) { double 'Friend 2', facebook_uid: '100', full_name: 'Jenny' }

  it 'returns friends of friends' do
    user_node    = create_node(user)
    friend1_node = create_node(friend1)
    friend2_node = create_node(friend2)

    user_node.both(:friends) << friend1_node
    friend1_node.both(:friends) << friend2_node

    records = MatchMaking::Friends.call(user)
    expect(records[0]).to eq friend2.facebook_uid
  end

  it 'ignores previous matches' do
    user_node    = create_node(user)
    friend1_node = create_node(friend1)
    friend2_node = create_node(friend2)

    user_node.both(:friends) << friend1_node
    friend1_node.both(:friends) << friend2_node
    user_node.both(:match) << friend2_node

    records = MatchMaking::Friends.call(user)
    expect(records.size).to eq 0
  end

  def create_node(record)
    node = Neography::Node.create_unique('user_index', 'uid', record.facebook_uid,
                                         'uid' => record.facebook_uid,
                                         'name' => record.full_name)
    node.add_to_index('user_index', 'uid', record.facebook_uid)
    node
  end
end

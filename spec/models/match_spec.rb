require 'rails_helper'

describe Match do
  describe '.for' do
    it 'returns all matches associated with the given user' do
      user   = create :user

      match1 = create :match, user1: user
      match2 = create :match, user2: user

      matches = Match.for(user)

      expect(matches[0]).to eq match2
      expect(matches[1]).to eq match1
    end
  end
end

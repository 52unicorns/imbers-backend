require 'rails_helper'

describe Match do
  describe '.for' do
    it 'returns all matches associated with the given user' do
      user  = create :user
      match = create :match
      create :match_user, user: user, match: match
      create :match # other match

      matches = Match.for(user)

      expect(matches.size).to eq 1
      expect(matches.first).to eq match
    end
  end
end

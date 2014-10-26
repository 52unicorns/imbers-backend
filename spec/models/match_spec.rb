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

  describe '#revealed?' do
    let(:user1) { create :user }
    let(:user2) { create :user }
    let(:match) { create :match, users: [user1, user2] }

    it 'returns true when all users have revealed their identity' do
      match.match_users.each(&:reveal!)
      expect(match).to be_revealed
    end

    it 'returns false when users still have to reveal their identity' do
      match.match_users.first.reveal!
      expect(match).to_not be_revealed
    end
  end
end

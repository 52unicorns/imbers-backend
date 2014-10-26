require 'rails_helper'

describe MatchMaker do
  describe '.create' do
    it 'can create a match with another user in the app' do
      user       = create :user
      other_user = create :user

      match = MatchMaker.create(user)

      expect(match.users) =~ [user, other_user]
    end

    it 'returns nil if it cannot create a match' do
      user = create :user
      match = MatchMaker.create(user)
      expect(match).to be nil
    end
  end
end

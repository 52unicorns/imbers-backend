require 'rails_helper'

describe AccessToken do
  describe '#revoke!' do
    it 'revokes the given access token' do
      access_token = create :access_token
      access_token.revoke!
      expect(access_token.revoked_at).to be_present
    end
  end

  describe '#revoke?' do
    it 'returns true when the access token has been revoked' do
      access_token = create :access_token, revoked_at: Time.zone.now
      expect(access_token).to be_revoked
    end

    it 'returns false when the access token has not been revoked' do
      access_token = create :access_token, revoked_at: nil
      expect(access_token).to_not be_revoked
    end
  end
end

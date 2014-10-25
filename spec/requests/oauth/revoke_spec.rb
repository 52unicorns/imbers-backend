require 'rails_helper'

describe '/oauth/revoke' do
  describe 'POST /' do
    it 'responds with 200 even if the provided access token is invalid' do
      post '/oauth/revoke', { token: 'invalid' }, http_env
      expect(response.status).to eq 200
    end

    it 'revokes a valid token' do
      access_token = create :access_token
      post '/oauth/revoke', { token: access_token.token }, http_env
      expect(response.status).to eq 200
      expect(access_token.reload).to be_revoked
    end
  end
end

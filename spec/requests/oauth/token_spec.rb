require 'rails_helper'

describe '/oauth/token' do
  describe 'POST /' do
    it 'responds with an error when the grant type is invalid' do
      params = { grant_type: 'invalid' }
      post '/oauth/token', params, http_env

      expect(response.status).to eq 401
      expect(json[:errors]).to be_present
      expect(json[:errors][0][:id]).to eq 'oauth.request.invalid'
    end

    it 'responds with an error when the access token is invalid', :vcr do
      params = { grant_type: 'assertion', assertion: 'invalid' }
      post '/oauth/token', params, http_env

      expect(response.status).to eq 401
      expect(json[:errors]).to be_present
      expect(json[:errors][0][:id]).to eq 'oauth.resource_owner.invalid'
    end

    it 'responds with a new access token when the facebook access token is valid', :vcr do
      params = { grant_type: 'assertion', assertion: FIXTURES[:access_token] }
      post '/oauth/token', params, http_env

      expect(response.status).to eq 201
      expect(json[:access_token]).to be_present
      expect(json[:expires_in]).to be_present
      expect(json[:token_type]).to be_present
    end
  end
end

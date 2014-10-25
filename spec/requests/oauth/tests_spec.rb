require 'rails_helper'

describe '/oauth/test' do
  describe 'GET /' do
    it 'responds with 401 when there is no access token provided' do
      get '/oauth/test', {}, http_env
      expect(response.status).to eq 401
    end

    it 'responds with 401 when the access token was invalid' do
      http_env['HTTP_AUTHORIZATION'] = 'Bearer invalid'
      get '/oauth/test', {}, http_env
      expect(response.status).to eq 401
    end

    it 'responds with 401 when the access token was revoked' do
      access_token = create :access_token, revoked_at: 1.minute.ago
      http_env['HTTP_AUTHORIZATION'] = "Bearer #{access_token.token}"
      get '/oauth/test', {}, http_env
      expect(response.status).to eq 401
    end

    it 'responds with 200 when the access token is valid' do
      access_token = create :access_token
      http_env['HTTP_AUTHORIZATION'] = "Bearer #{access_token.token}"
      get '/oauth/test', {}, http_env
      expect(response.status).to eq 200
    end
  end
end

require 'rails_helper'

describe '/api/v0/matches' do
  before { authenticate! }

  let(:user) { create :user }

  describe 'GET /' do
    it 'responds with the matches of the current user' do
      match = create :match, users: [current_user, user]

      get '/api/v0/matches', nil, http_env

      expect(response.status).to eq 200
      expect(json[0][:id]).to eq match.id
      expect(json[0][:user][:id]).to eq user.id
    end
  end

  describe 'GET /:id' do
    it 'responds with the requested match' do
      match = create :match, users: [current_user, user]

      get "/api/v0/matches/#{match.id}", nil, http_env

      expect(response.status).to eq 200
      expect(json[:id]).to eq match.id
      expect(json[:user][:id]).to eq user.id
    end
  end
end

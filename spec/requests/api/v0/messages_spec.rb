require 'rails_helper'

describe '/api/v0/matches/:match_id/messages' do
  before { authenticate! }
  let(:match) { create :match, users: [current_user] }

  describe 'POST /' do
    it 'creates a new messages' do
      params = { body: 'test' }
      post "/api/v0/matches/#{match.id}/messages", params, http_env
      expect(response.status).to eq 201
    end
  end

  describe 'GET /' do
    it 'returns the messages of the given match' do
      message = create :message, match: match
      get "/api/v0/matches/#{match.id}/messages", nil, http_env
      expect(json[0][:id]).to eq message.id
    end
  end
end

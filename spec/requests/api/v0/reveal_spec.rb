require 'rails_helper'

describe '/api/v0/matches/:match_id/reveal' do
  before { authenticate! }
  let(:match) { create :match, users: [current_user] }

  describe 'POST /' do
    it "reveals user's identity" do
      post "/api/v0/matches/#{match.id}/reveal", nil, http_env
      expect(response.status).to eq 201
      expect(match.match_users.first.revealed).to be true
    end
  end
end

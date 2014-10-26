require 'rails_helper'

describe '/api/v0/matches' do
  before { authenticate! }

  describe 'GET /' do
    it 'responds with the matches of the current user' do
      match = create :match
      other_user = create(:match_user, match: match).user
      create :match_user, match: match, user: current_user

      get '/api/v0/matches', nil, http_env

      expect(response.status).to eq 200
      expect(json[0][:id]).to eq match.id
      expect(json[0][:user][:id]).to eq other_user.id
    end
  end
end

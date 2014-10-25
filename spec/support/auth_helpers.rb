module SpecSupport
  module AuthHelpers
    extend ActiveSupport::Concern

    included do
      let(:current_user) { create(:user) }

      def authenticate!
        token = create :access_token, user: current_user
        http_env['HTTP_AUTHORIZATION'] = "Bearer #{token.token}"
      end
    end
  end
end

module Api
  module V0
    class RevealController < MatchBaseController
      def create
        @match.reveal!(current_user)
        render status: :created, json: {}
      end
    end
  end
end

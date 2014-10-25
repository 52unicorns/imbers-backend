module Api
  module V0
    class MatchesController < BaseController
      def index
        @matches = Match.for(current_user)
      end
    end
  end
end

module Api
  module V0
    class MatchesController < BaseController
      def index
        @matches = Match.for(current_user)
      end

      def show
        @match = Match.for(current_user).find(params[:id])
      end
    end
  end
end

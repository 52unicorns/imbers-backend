module Api
  module V0
    class MatchBaseController < BaseController
      before_action :find_match

      private

      def find_match
        @match = Match.for(current_user).find(params[:match_id])
      end
    end
  end
end

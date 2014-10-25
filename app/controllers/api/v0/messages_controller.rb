module Api
  module V0
    class MessagesController < BaseController
      before_action :find_match

      def index
        @messages = @match.messages
      end

      def create
        respond_with @match.messages.create!(
          body: params[:body],
          user: current_user
        )
      end

      private

      def find_match
        @match = Match.for(current_user).find(params[:match_id])
      end
    end
  end
end

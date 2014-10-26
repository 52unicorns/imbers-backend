module Api
  module V0
    class MessagesController < MatchBaseController
      def index
        @messages = @match.messages.since(params[:since])
      end

      def create
        respond_with @match.messages.create!(
          body: params[:body],
          user: current_user
        )
      end
    end
  end
end

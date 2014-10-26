module Api
  module V0
    class MessagesController < MatchBaseController
      def index
        @messages = @match.messages.since(params[:since])
      end

      def create
        @message = @match.messages.create(
          body: params[:body],
          user: current_user
        )

        respond_with @message if @message.invalid?
      end

      private

      def since
        return if params[:since].blank?
        # Forgive me, Lord
        params[:since].to_datetime + 1.second
      end
    end
  end
end

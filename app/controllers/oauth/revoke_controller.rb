module Oauth
  class RevokeController < ApplicationController
    def create
      access_token = AccessToken.find_by token: params[:token]
      access_token.revoke! if access_token.present?
      render json: {}, status: :ok
    end
  end
end

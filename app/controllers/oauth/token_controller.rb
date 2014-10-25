module Oauth
  class TokenController < ApplicationController
    GRANT_TYPE = 'assertion'

    INVALID_REQUEST = {
      id: 'oauth.request.invalid',
      type: 'invalid',
      subject: 'request',
      namespace: 'oauth',
      message: I18n.t('oauth.invalid_request')
    }

    INVALID_ACCESS_TOKEN = {
      id: 'oauth.resource_owner.invalid',
      type: 'invalid',
      subject: 'resource_owner',
      namespace: 'oauth',
      message: I18n.t('oauth.invalid_access_token')
    }

    def create
      return invalid_request! if params[:grant_type] != GRANT_TYPE
      fb_user = Facebook.find params[:assertion]
      return invalid_access_token! if fb_user.blank?

      user = User.from_facebook!(fb_user)
      respond_with AccessToken.create! user: user
    end

    private

    def invalid_request!
      render json: { errors: [INVALID_REQUEST] }, status: :unauthorized
    end

    def invalid_access_token!
      render json: { errors: [INVALID_ACCESS_TOKEN] }, status: :unauthorized
    end
  end
end

module Oauth
  class TokenController < ApplicationController
    attr_accessor :fb_user

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

    before_action :validate_request

    def create
      user = User.find_by(facebook_uid: fb_user.id.to_s)

      if user.blank?
        user = User.from_facebook!(fb_user)
        OnboardingWorker.perform_async(user.id)
      end

      respond_with AccessToken.create! user: user
    end

    private

    def validate_request
      return invalid_request! if params[:grant_type] != GRANT_TYPE
      self.fb_user = Facebook.find params[:assertion]
      return invalid_access_token! if fb_user.blank?
    end

    def invalid_request!
      render json: { errors: [INVALID_REQUEST] }, status: :unauthorized
    end

    def invalid_access_token!
      render json: { errors: [INVALID_ACCESS_TOKEN] }, status: :unauthorized
    end
  end
end

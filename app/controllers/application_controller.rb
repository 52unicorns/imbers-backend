class ApplicationController < ActionController::Base
  TOKEN_TYPE = 'Bearer'

  NOT_FOUND = {
    id: 'resource.not_found',
    reason: 'not_found',
    subject: 'resource',
    message: I18n.t('http_errors.not_found')
  }

  attr_reader :current_user

  respond_to :json
  responders :json
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def authenticate_user!
    type, token = http_authorization.split(' ')
    return unauthorized! if type != TOKEN_TYPE
    access_token = AccessToken.find_by(token: token)
    return unauthorized! if !access_token || access_token.revoked?
    @current_user = access_token.user
  end

  def unauthorized!
    head :unauthorized
  end

  def http_authorization
    request.headers.fetch('HTTP_AUTHORIZATION') { '' }
  end

  def not_found
    render json: { errors: [NOT_FOUND] }, status: :not_found
  end
end

class AccessTokenSerializer < ActiveModel::Serializer
  TOKEN_TYPE = 'Bearer'

  attributes :access_token, :token_type, :expires_in

  def access_token
    object.token
  end

  def token_type
    TOKEN_TYPE
  end
end

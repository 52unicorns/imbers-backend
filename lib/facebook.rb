module Facebook
  module_function

  def find(access_token)
    client = create_client(access_token)
    params = client.get_object('me')
    params[:access_token] = access_token
    Facebook::User.new(params)
  rescue Koala::Facebook::AuthenticationError => e
    Rails.logger.error e
    nil
  end

  def friends(access_token)
    client = create_client(access_token)
    client.get_connections('me', 'friends')
  end

  def likes(access_token)
    client = create_client(access_token)
    client.get_connections('me', 'likes')
  end

  def create_client(access_token)
    Koala::Facebook::API.new(access_token)
  end
end

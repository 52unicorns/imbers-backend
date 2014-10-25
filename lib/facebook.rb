module Facebook
  module_function

  def find(access_token)
    graph = Koala::Facebook::API.new(access_token)
    profile = graph.get_object('me')
    Facebook::User.new(profile)
  rescue Koala::Facebook::AuthenticationError => e
    Rails.logger.error e
    nil
  end
end

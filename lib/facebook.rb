module Facebook
  module_function

  def find(access_token)
    Facebook::User.find(access_token)
  rescue Koala::Facebook::AuthenticationError => e
    Rails.logger.error e
    nil
  end
end

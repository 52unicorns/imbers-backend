class OnboardingWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    Facebook.friends(user.access_token).each do |friend|
      Friendship.create(user, friend)
    end
    MatchMaker.create(user)
  end
end

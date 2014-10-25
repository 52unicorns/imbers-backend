class OnboardingWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    MatchMaker.create(user)
  end
end

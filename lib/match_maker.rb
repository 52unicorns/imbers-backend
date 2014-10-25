class MatchMaker
  attr_reader :user

  class << self
    def create(user)
      new(user).perform
    end
  end

  def initialize(user)
    @user = user
  end

  def perform
    simple
  end

  private

  def simple
    other_user = User.where.not(id: user.id).first
    return if other_user.blank?
    Match.create!(user1: user, user2: other_user)
  end
end

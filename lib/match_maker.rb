class MatchMaker
  attr_reader :user

  ALGORITHMS = [
    MatchMaking::FriendsInterests,
    MatchMaking::Friends,
    MatchMaking::Interests,
    MatchMaking::Simple
  ]

  class << self
    def create(user)
      new(user).perform
    end
  end

  def initialize(user)
    @user = user
  end

  def perform
    matches = nil

    ALGORITHMS.each do |alg|
      matches = alg.call(user)
      break if matches.present?
    end

    return unless matches.present?
    other_user = User.find_by!(facebook_uid: matches.first)
    create_match(user, other_user)
  end

  private

  def create_match(user, other_user)
    Match.create!.tap do |match|
      match.match_users.create! user: user
      match.match_users.create! user: other_user
    end

    # TODO(vesln): neo4j relationship
  end
end

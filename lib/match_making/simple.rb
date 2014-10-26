module MatchMaking
  class Simple
    def self.call(user)
      user = User.where.not(id: user.id).first
      return if user.blank?
      [user.facebook_uid]
    end
  end
end

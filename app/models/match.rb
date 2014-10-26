class Match < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  has_many :messages
  has_many :match_users
  has_many :users, through: :match_users

  class << self
    def for(user)
      joins(:match_users).where(match_users: { user_id: user.id })
    end
  end
end

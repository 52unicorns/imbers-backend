class Match < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user1, class_name: User
  belongs_to :user2, class_name: User

  validates :user1_id, presence: true
  validates :user2_id, presence: true

  class << self
    def for(user)
      where('user1_id = :user_id OR user2_id = :user_id', user_id: user.id)
    end
  end
end

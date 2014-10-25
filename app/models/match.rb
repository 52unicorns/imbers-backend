class Match < ActiveRecord::Base
  belongs_to :user1, class_name: User
  belongs_to :user2, class_name: User

  validates :user1_id, presence: true
  validates :user2_id, presence: true
end

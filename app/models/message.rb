class Message < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :match

  validates :user_id, presence: true
  validates :match_id, presence: true
  validates :body, presence: true

  class << self
    def since(date = nil)
      if date.present?
        where('created_at > ?', date)
      else
        where(nil)
      end
    end
  end
end

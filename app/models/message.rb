class Message < ActiveRecord::Base
  LIMIT = 50

  default_scope { order('created_at DESC') }

  belongs_to :user
  belongs_to :match

  validates :user_id, presence: true
  validates :match_id, presence: true
  validates :body, presence: true

  before_validation :verify_message_count

  class << self
    def since(date = nil)
      if date.present?
        where('created_at > ?', date)
      else
        where(nil)
      end
    end
  end

  private

  def verify_message_count
    return if match.blank?
    errors.add(:general, 'you cannot send more messages') if match.messages.count >= LIMIT
  end
end

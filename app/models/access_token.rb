class AccessToken < ActiveRecord::Base
  belongs_to :user

  before_validation :generate_token
  before_validation :assign_expires_in

  validates :token,   presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, presence: true

  def revoke!
    update! revoked_at: Time.zone.now
  end

  def revoked?
    revoked_at?
  end

  private

  def generate_token
    return if token?

    loop do
      self.token = SecureRandom.hex(32)
      break unless self.class.find_by(token: token)
    end
  end

  def assign_expires_in
    self.expires_in = 3.months.from_now.to_i - Time.zone.now.to_i unless expires_in?
  end
end

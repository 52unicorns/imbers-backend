class User < ActiveRecord::Base
  has_many :access_tokens

  validates :facebook_uid, presence: true,
                           uniqueness: { case_sensitive: false }

  class << self
    def fb_user!(fb_user)
      user = find_by(facebook_uid: fb_user.id.to_s)
      return user if user.present?
      create!(facebook_uid: fb_user.id.to_s)
    end
  end
end

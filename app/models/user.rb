class User < ActiveRecord::Base
  has_many :access_tokens
  has_many :matches

  validates :facebook_uid, presence: true,
                           uniqueness: { case_sensitive: false }

  class << self
    def from_facebook!(fb_user)
      create!(
        first_name:    fb_user.first_name,
        last_name:     fb_user.last_name,
        gender:        fb_user.gender,
        access_token:  fb_user.access_token,
        birthday:      fb_user.birthday,
        location_uid:  fb_user.location_id,
        location_name: fb_user.location_name,
        facebook_uid:  fb_user.id.to_s
      )
    end
  end

  def avatar_url
    "https://graph.facebook.com/#{facebook_uid}/picture"
  end

  def facebook_url
    "https://facebook.com/#{facebook_uid}"
  end
end

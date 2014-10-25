class User < ActiveRecord::Base
  has_many :access_tokens

  validates :facebook_uid, presence: true,
                           uniqueness: { case_sensitive: false }

  class << self
    def from_facebook!(fb_user)
      user = find_by(facebook_uid: fb_user.id.to_s)
      return user if user.present?

      create!(
        first_name:    fb_user.first_name,
        last_name:     fb_user.last_name,
        gender:        fb_user.gender,
        birthday:      fb_user.birthday,
        location_uid:  fb_user.location_id,
        location_name: fb_user.location_name,
        facebook_uid:  fb_user.id.to_s
      )
    end
  end
end
